module Test

// let rec false_elim (#a:Type) (u:unit{false}) : Tot a = false_elim ()

// let a n :nat = 1
// let f (ls:list nat) :nat =
//   let rec aux (xs:list nat) :nat = a 0
//   in
//   0

// assume type t (n:nat) :Type0
// assume val foo: #n:nat{n > 0} -> t n -> Tot unit

// let bar (k:nat) (x:t k) = if k > 0 then foo x else ()


let rec fact (a:Type) (x:nat) :nat = if x = 0 then 0 else x + fact a (x - 1)

let foo (a:Type) = assert_norm (fact a 2 = 3)





(* Issues *)
// assume type predicate: Type0

// assume val bar (x:int{predicate}) :Tot unit

// let foo (x:int) :Lemma (requires True) (ensures True) [SMTPat (bar x)] = ()

// let fa_intro_lem (p:int -> Type0) (f:(x:int -> squash (p x))) :Lemma (forall (x:int). p x)
//   = FStar.Classical.forall_intro #int #p (fun x -> (f x <: Lemma (p x)))
