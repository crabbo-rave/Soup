import Mathlib.Data.Nat.Basic

def Fin' (n : Nat) := Fin n

variable (a : α) (as : List α)

instance : OfNat (Fin' (List.length (a :: as))) (nat_lit 0) :=
  ⟨⟨0, (Nat.succ_pos _ : Nat.lt 0 (List.length (a :: as)))⟩⟩

class IsPos (n : Nat) := pos : 0 < n

instance : IsPos (Nat.succ n) := ⟨Nat.succ_pos _⟩

instance [IsPos (n - i)] : OfNat (Fin' n) i :=
  ⟨i, Nat.lt_of_not_le fun h => ne_of_gt IsPos.pos (Nat.sub_eq_zero_iff_le.2 h)⟩

def List.get' {α : Type u} : (as : List α) → (i : Fin' as.length) → α
  | a::as, ⟨0, _⟩ => a 
  | a::as, ⟨i+1, h⟩ => as.get' ⟨i, Nat.lt_of_succ_lt_succ h⟩

/- Deprecated, older versions of functions, but just work keeping
as reference: -/

notation "#(" a ")" => (Fin.mk a (by decide))

-- #eval [1, 2, 3, 4].get' #(2)