module BV.Test

open FStar.UInt
open FStar.Tactics
open BV
module U64 = FStar.UInt64

/// These examples only rely on facts about bounded ints, U64, and Prims
/// In particular, pruning away sequences, reflection, tactics etc.
/// from the SMT solver makes a big difference
#reset-options "--using_facts_from '+FStar.UInt +FStar.UInt64 +Prims' --__temp_fast_implicits --use_two_phase_tc false"

////////////////////////////////////////////////////////////////////////////////
//Some examples working on FStar.UInt.uint_t, i.e., bounded natural numbers
////////////////////////////////////////////////////////////////////////////////
let test1 (x y: uint_t 64) =
    assert_by_tactic (logand x y == logand y x)
                      bv_tac

let test2 (x y : uint_t 64) =
    assert_by_tactic (logand (logand x y) y == logand y (logand y x))
                      bv_tac

let test3 (x y : uint_t 64) =
    assert_by_tactic (logand (logand (logand x y) x) y == logand y (logand x (logand y x)))
                      bv_tac

let test4 (x y : uint_t 64) =
    assert_by_tactic (logand (logand x (logxor x y)) y == logand y (logand x (logxor y x)))
                      bv_tac

/// This also works when you expliclity coerce from a machine integer to a uint_t
let test5 (x y: U64.t) =
    assert_by_tactic (logand (U64.v x) (U64.v y) == logand (U64.v y) (U64.v x))
                      bv_tac

let test6 (x y: uint_t 64) =
    assert_by_tactic (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y)) == logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))
)
                      bv_tac

let test7 (x y: uint_t 64) =
    assert_by_tactic (logor (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))) (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))) == logor (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))) (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))))
                      bv_tac

let test8 (x y: uint_t 64) =
    assert_by_tactic (logand (logor (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))) (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x)))) (logor (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))) (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y)))) == logand (logor (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))) (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y)))) (logor (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))) (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x)))))
                      bv_tac


let test9 (x y: uint_t 64) =
    assert_by_tactic (logor (logand (logor (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))) (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x)))) (logor (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))) (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))))) (logand (logor (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))) (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y)))) (logor (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))) (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))))) == logor (logand (logor (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))) (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y)))) (logor (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))) (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))))) (logand (logor (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))) (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x)))) (logor (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))) (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))))))
                      bv_tac

let test10 (x y: uint_t 64) =
    assert_by_tactic (
logand (logor (logand (logor (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))) (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x)))) (logor (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))) (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))))) (logand (logor (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))) (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y)))) (logor (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))) (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x)))))) (logor (logand (logor (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))) (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y)))) (logor (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))) (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))))) (logand (logor (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))) (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x)))) (logor (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))) (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y)))))) == logand (logor (logand (logor (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))) (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y)))) (logor (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))) (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))))) (logand (logor (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))) (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x)))) (logor (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))) (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y)))))) (logor (logand (logor (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))) (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x)))) (logor (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))) (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))))) (logand (logor (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x))) (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y)))) (logor (logand (logor (logand x y) (logand y x)) (logor (logand y x) (logand x y))) (logand (logor (logand y x) (logand x y)) (logor (logand x y) (logand y x)))))))
                      bv_tac


////////////////////////////////////////////////////////////////////////////////
//Now for some examples working directly on machine integers
//Here's a tactic that rewrites identities on machine integers U64.t to
//identities on the corresponding uint_t 64
//and then uses bv_tac to encode those identities to Z3 bitvectors
////////////////////////////////////////////////////////////////////////////////


/// First a simple one
let test11 (x y: U64.t) =
    assert_by_tactic (U64.logand x y == U64.logand y x)
                     bv64_tac

/// In this one, the tactic works by:
///   -- 1. rewriting the goal to
///            ` v (U64.logand x (U64.logand y (U64.logand z z))) ==
///              v (U64.logand (U64.logand x y) z)`
///   -- 2. recursive applying the homomorphisms ..
///         e.g., on the RHS
///             v (U64.logand x (U64.logand y (U64.logand z z)))  ~>
///             logand (v x)  (v (U64.logand y (U64.logand z z))) ~>
///             logand (v x)  (logand (v y) (v (U64.logand z z)))  ~>
///             logand (v x)  (logand (v y) (logand (v z) (v z)))
///         and similarly on the LHS
///   -- 3. We're left with  bitwise operations on uint_t 64,
///         which bv_tac encodes to FStar.BitVector
///   -- 4. Finally, F*'s built-in  SMT encoding encode FStar.BitVector.t 64
///         to Z3's primitive bv 64.
let test12 (x y z: U64.t) =
    assert_by_tactic (U64.logand x (U64.logand y (U64.logand z z)) ==
                      U64.logand (U64.logand x y) z)
                     bv64_tac
