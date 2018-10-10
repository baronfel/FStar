module FStar.Universe

(** This module implements some basic facilities to raise the universe of a type *
  * The type [raise_t a] is supposed to be isomorphic to [a] but in a higher     *
  * universe. The two functions [raise_val] and [dowgrade_val] allow to coerce   *
  * from [a] to [raise_t a] and back.                                            **)

noeq type raise0 (a : Type u#a) : Type u#(max a (b + 1)) =
| Ret : a -> raise0 a

let raise_t a = raise0 a
let raise_val #a x = Ret x
let downgrade_val #a x = match x with Ret x0 -> x0

let downgrade_val_raise_val #a x = ()

let raise_val_downgrade_val #a x = ()
