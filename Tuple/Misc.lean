import Mathlib.Data.Nat.Basic

def Fin' (n : Nat) := Fin n

class IsPos (n : Nat) := pos : 0 < n

instance : IsPos (Nat.succ n) := ⟨Nat.succ_pos _⟩

instance [IsPos (n - i)] : OfNat (Fin' n) i :=
  ⟨i, Nat.lt_of_not_le fun h => ne_of_gt IsPos.pos (Nat.sub_eq_zero_iff_le.2 h)⟩

notation "♯" n => (⟨n, by decide⟩ : Fin _)

/-- Reducible `List.get` -/
@[reducible] def List.get' {α : Type u} : (as : List α) → (i : Nat) → LT.lt i as.length → α
  | nil,       i,          h => absurd h (Nat.not_lt_zero _)
  | cons a as, 0,          h => a
  | cons a as, Nat.succ i, h =>
    have : LT.lt i.succ as.length.succ := length_cons .. ▸ h
    get' as i (Nat.le_of_succ_le_succ this)
