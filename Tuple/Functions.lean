import Tuple.Core
import Tuple.Misc
-- import Tuple.Syntax

namespace Tuple

/-- Returns the first element of a tuple  -/
def head {α : Type} {αs : List Type} (tup : Tuple (α :: αs)) : α :=
  match tup with
  | Tuple.cons x xs => x

/-- Returns a tuple of all the elements besides the first -/
def tail {α : Type} {αs : List Type} (tup : Tuple (α :: αs)) : Tuple αs :=
  match tup with
  | Tuple.cons x xs => xs

/-- Returns the length of a tuple -/
def length {αs : List Type} (tup : Tuple (αs)) : Nat :=
  let rec lengthAux {αs : List Type} (tup: Tuple (αs)) (length: Nat) : Nat :=
    match tup with
    | Tuple.unit => length
    | Tuple.cons _ xs => lengthAux xs (length + 1)
  match tup with
  | Tuple.unit => 0
  | _ => lengthAux tup 0

/-- Returns the nth element of a tuple -/
def nth : {αs : List Type} → (t : Tuple αs) → (n : Nat) → (h : n < αs.length := by simp) → αs.get' n h
  | _, Tuple.unit, n, h => False.elim $ Nat.not_lt_zero _ h
  | _, Tuple.cons x xs, 0, h => x
  | _, Tuple.cons x xs, (n+1), h => xs.nth n (Nat.le_of_succ_le_succ h)

end Tuple

open Tuple
/- Getting the nth index -/
notation:max p "^" i => nth p i
notation:max p "#" i => nth p i
notation:max p "@" i => nth p i
notation:max p "[" i "]" => nth p i
notation:max p "::" i => nth p i
notation:max p "∧" i => nth p i
