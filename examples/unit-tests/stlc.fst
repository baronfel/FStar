(*
   Copyright 2008-2014 Catalin Hritcu, Nikhil Swamy, Microsoft Research and Inria

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*)

module Stlc

type ty =
  | TBool  : ty
  | TArrow : ty -> ty -> ty

let tidbool = TArrow TBool TBool

type exp =
  | EVar   : int -> exp
  | EApp   : exp -> exp -> exp
  | EAbs   : int -> ty -> exp -> exp
  | ETrue  : exp
  | EFalse : exp
  | EIf    : exp -> exp -> exp -> exp

let eidbool = EAbs 0 TBool (EVar 0)
let eappidbool = EApp eidbool ETrue
let enot = EAbs 0 TBool (EIf (EVar 0) EFalse ETrue)

val is_value : exp -> Tot bool
let is_value e =
  match e with
  | EAbs _ _ _
  | ETrue
  | EFalse     -> true
  | _          -> false

let a1 = assert(is_value eidbool)
let a2 = assert(not (is_value eappidbool))

(* Because we only consider call-by-value reduction, we will ever only
   substitute closed values, so this definition of substitution is
   good enough *)
val subst : int -> exp -> exp -> Tot exp
let rec subst x e e' =
  match e' with
  | EVar x' -> if x = x' then e else e'
  | EAbs x' t e1 ->
      EAbs x' t (if x = x' then e1 else (subst x e e1))
  | EApp e1 e2 -> EApp (subst x e e1) (subst x e e2)
  | ETrue -> ETrue
  | EFalse -> EFalse
  | EIf e1 e2 e3 -> EIf (subst x e e1) (subst x e e2) (subst x e e3)

val step : exp -> Tot (option exp)
let rec step e =
  match e with
  | EApp e1 e2 ->
      if is_value e1 then
        if is_value e2 then
          match e1 with
          | EAbs x t e' -> Some (subst x e2 e')
          | _           -> None
        else
          match (step e2) with
          | Some e2' -> Some (EApp e1 e2')
          | None     -> None
      else
        (match (step e1) with
        | Some e1' -> Some (EApp e1' e2)
        | None     -> None)
  | EIf e1 e2 e3 ->
      if is_value e1 then
        match e1 with
        | ETrue   -> Some e2
        | EFalse  -> Some e3
        | _       -> None
      else
        (match (step e1) with
        | Some e1' -> Some (EIf e1' e2 e3)
        | None     -> None)
  | _ -> None

let a3 = assert (step eappidbool = Some ETrue)
let a4 = assert (step (EApp ETrue ETrue) = None)

type env = int -> Tot (option ty)

val empty : env
let empty _ = None

val extend : env -> int -> ty -> Tot env
let extend g x t x' = if x = x' then Some t else g x'

val typing : env -> exp -> Tot (option ty)
let rec typing g e =
  match e with
  | EVar x -> g x
  | EAbs x t e1 ->
      (match typing (extend g x t) e1 with
      | Some t' -> Some (TArrow t t')
      | None    -> None)
  | EApp e1 e2 ->
      (match typing g e1, typing g e2 with
      | Some (TArrow t11 t12), Some t2 -> if t11 = t2 then Some t12 else None
      | _                    , _       -> None)
  | ETrue  -> Some TBool
  | EFalse -> Some TBool
  | EIf e1 e2 e3 ->
      (match typing g e1, typing g e2, typing g e3 with
      | Some TBool, Some t2, Some t3 -> if t2 = t3 then Some t2 else None
      | _         , _      , _       -> None)

(* These canonical forms lemmas are traditionally used for manual
   progress proofs; they are not used by the automated proof below *)
val canonical_forms_bool : e:exp -> Lemma
      (requires (typing empty e=Some TBool /\ is_value e))
      (ensures (is_ETrue e \/ is_EFalse e))
let canonical_forms_bool e = ()

val canonical_forms_fun : e:exp -> t1:ty -> t2:ty -> Lemma
      (requires (typing empty e == Some (TArrow t1 t2) /\ is_value e))
      (ensures (is_EAbs e))
let canonical_forms_fun e t1 t2 = ()

val progress : e:exp -> Lemma
      (requires (is_Some (typing empty e)))
      (ensures (is_value e \/ (is_Some (step e))))
let rec progress e = using_induction_hyp progress

val appears_free_in : x:int -> e:exp -> Tot bool
let rec appears_free_in x e =
  match e with
  | EVar y -> x = y
  | EApp e1 e2 -> appears_free_in x e1 || appears_free_in x e2
  | EAbs y _ e1 -> x <> y && appears_free_in x e1
  | EIf e1 e2 e3 ->
      appears_free_in x e1 || appears_free_in x e2 || appears_free_in x e3
  | ETrue
  | EFalse -> false (* NS: writing default cases for recursive functions is bad for the solver. TODO: fix *)

val free_in_context : x:int -> e:exp -> g:env -> Lemma
      (requires (appears_free_in x e /\ is_Some (typing g e)))
      (ensures (is_Some (g x)))
let rec free_in_context x e g =
  match e with
  | EAbs y t e1 ->
     if x = y
     then ()
     else free_in_context x e1 (extend g y t)

  | EApp e1 e2 ->
     if appears_free_in x e1
     then free_in_context x e1 g
     else free_in_context x e2 g

  | EIf e1 e2 e3 ->
     if      appears_free_in x e1 then free_in_context x e1 g
     else if appears_free_in x e2 then free_in_context x e2 g
     else                              free_in_context x e3 g

  | _ -> ()

(* The proof above can be made smaller if we move the quantification
   of x and the appears_free_in x e premise to the conclusion, since
   there is less manual instantiation left to do.  This kind of
   optimization might become irrelevant once we have automatic
   induction. *)
val free_in_context' : e:exp -> g:env -> Lemma
      (requires (is_Some (typing g e)))
      (ensures (forall (x:int). appears_free_in x e ==> is_Some (g x)))
let rec free_in_context' e g =
  match e with
  | EAbs y t e1 -> free_in_context' e1 (extend g y t)
  | EApp e1 e2 -> free_in_context' e1 g; free_in_context' e2 g
  | EIf e1 e2 e3 ->
      free_in_context' e1 g;
      free_in_context' e2 g;
      free_in_context' e3 g
  | _ -> ()

(* Corollary of free_in_context when g=empty -- fed to the SMT solver *)
val typable_empty_closed : x:int -> e:exp -> Lemma
      (requires (is_Some (typing empty e) /\ appears_free_in x e))
      (ensures False)
      [SMTPat (appears_free_in x e)]
let typable_empty_closed x e = free_in_context x e empty

opaque logic type Equal (g1:env) (g2:env) =
                 (forall (x:int). g1 x=g2 x)
opaque logic type EqualE (e:exp) (g1:env) (g2:env) =
                 (forall (x:int). appears_free_in x e ==> g1 x=g2 x)

val context_invariance : e:exp -> g:env -> g':env
                     -> Lemma
                          (requires (EqualE e g g'))
                          (ensures (typing g e == typing g' e))
let rec context_invariance e g g' =
  match e with
  | EAbs x t e1 ->
     context_invariance e1 (extend g x t) (extend g' x t)

  | EApp e1 e2 ->
     context_invariance e1 g g';
     context_invariance e2 g g'

  | EIf e1 e2 e3 ->
     context_invariance e1 g g';
     context_invariance e2 g g';
     context_invariance e3 g g'

  | _ -> ()

val typing_extensional : g:env -> g':env -> e:exp
                      -> Lemma
                           (requires (Equal g g'))
                           (ensures (typing g e == typing g' e))
let typing_extensional g g' e = context_invariance e g g'

val swap : x:int -> x':int -> t:ty -> t':ty -> g:env -> Lemma
      (requires (x<>x'))
      (ensures (Equal (extend (extend g x t) x' t') (extend (extend g x' t') x t)))
let swap x x' t t' g = ()

val substitution_preserves_typing :
      x:int -> t_x:ty -> e:exp -> t_e:ty -> v:exp -> g:env
      -> Lemma
          (requires ((typing (extend g x t_x) e == Some t_e)
                     /\ typing empty v == Some t_x))
          (ensures  (typing g (subst x v e) == Some t_e))
let rec substitution_preserves_typing x t_x e t_e v g =
  let gx = extend g x t_x in
  match e with
  | ETrue -> ()
  | EFalse -> ()
  | EVar x' ->
     if x=x'
     then context_invariance v empty g (* uses lemma typable_empty_closed *)
     else context_invariance e gx g (* no substitution, but need to show that x:t_x is removable *)

  | EApp e1 e2 ->
     let Some (TArrow t1 t2) = typing (extend g x t_x) e1 in
     substitution_preserves_typing x t_x e1 (TArrow t1 t2) v g;
     substitution_preserves_typing x t_x e2 t1 v g

  | EIf e1 e2 e3 ->
     substitution_preserves_typing x t_x e1 TBool v g;
     substitution_preserves_typing x t_x e2 t_e v g;
     substitution_preserves_typing x t_x e3 t_e v g

  | EAbs x' t' e1 ->
     let TArrow _ t_e1 = t_e in
     let gxx' = extend gx x' t' in
     let gx' = extend g x' t' in
     let gx'x = extend gx' x t_x in
     if x=x'
     then typing_extensional gxx' gx' e1
     else
       assert(x<>x');
(*       assert (Equal gxx' gx'x); -- this should work *)
(* We should at least get the admit by swap, but somehow F* gets
   really confused here and can't prove x<>x' altough it could one
   line above:
       swap x x' t_x t' g;
*)
       (* admitting this and continuing proof, the rest works *)
       admitP #(Equal gxx' gx'x) ();
       assert(typing gxx' e1 == Some t_e1);
       typing_extensional gxx' gx'x e1;
       assert(typing gx'x e1 == Some t_e1);
       substitution_preserves_typing x t_x e1 t_e1 v gx'

val preservation : e:exp -> e':exp -> t:ty
                -> Lemma
                     (requires (typing empty e == Some t /\ step e == Some e'))
                     (ensures (typing empty e' == Some t))
let rec preservation e e' t =
  match e with
  | EApp e1 e2 ->
     let Some t1 = typing empty e1 in
     if is_value e1
     then let TArrow targ _ = t1 in
          (if is_value e2
           then let EAbs x _ ebody = e1 in
                typing_extensional (extend empty x targ) (extend empty x targ) ebody;
                substitution_preserves_typing x targ ebody t e2 empty;
                typing_extensional empty empty (subst x e2 ebody)
           else preservation e2 (Some.v (step e2)) targ)
     else preservation e1 (Some.v (step e1)) t1

  | EIf e1 _ _ ->
      if is_value e1
      then ()
      else preservation e1 (Some.v (step e1)) TBool
