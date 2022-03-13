import Soup.HList.Core
import Soup.HList.Misc
import Soup.HList.Syntax

namespace HList

/-- Returns the first element of a HList -/
def head {α : Type} {αs : List Type} (tup : HList (α :: αs)) : α :=
  match tup with
  | HList.cons x xs => x

/-- Returns a HList of all the elements besides the first -/
def tail {α : Type} {αs : List Type} (tup : HList (α :: αs)) : HList αs :=
  match tup with
  | HList.cons x xs => xs

/-- Auxiliary function for length -/
private def lengthAux {αs : List Type} (tup: HList (αs)) (length: Nat) : Nat :=
  match tup with
  | HList.unit => length
  | HList.cons _ xs => lengthAux xs (length + 1)

/-- Returns the length of a HList -/
def length {αs : List Type} (tup : HList (αs)) : Nat :=
  match tup with
  | HList.unit => 0
  | _ => lengthAux tup 0

/-- Returns the nth element of a HList -/
-- def nth {αs : List Type} : (t : HList αs) → (n : Nat) → (h : n < αs.length := by simp) → αs.get' n h
--   | HList.unit, n, h => False.elim $ Nat.not_lt_zero _ h
--   | HList.cons x xs, 0, h => x
--   | HList.cons x xs, (n+1), h => xs.nth n (Nat.le_of_succ_le_succ h)

def nth {αs : List Type} : HList αs → (n : Fin' αs.length) → αs.get' n 
  | cons x xs, ⟨0, _⟩ => x
  | cons x xs, ⟨n+1, h⟩ => xs.nth ⟨n, Nat.lt_of_succ_lt_succ h⟩

/- Getting the nth index -/
notation:max p "^" i => nth p ⟨i, by decide⟩
notation:max p "#" i => nth p ⟨i, by decide⟩
notation:max p "@" i => nth p ⟨i, by decide⟩
notation:max p "[" i "]" => nth p ⟨i, by decide⟩
notation:max p "::" i => nth p ⟨i, by decide⟩
notation:max p "∧" i => nth p ⟨i, by decide⟩

def getTypes {αs : List Type} (_ : HList αs) : List Type := 
  αs

end HList
