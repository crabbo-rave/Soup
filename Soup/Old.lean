import Soup.HList

/- Collection of older versions of functions worth keeping. -/
namespace Old

@[reducible] private def List.get'' {α : Type u} : (as : List α) → (i : Nat) → LT.lt i as.length → α
  | List.nil,       i,          h => absurd h (Nat.not_lt_zero _)
  | List.cons a as, 0,          h => a
  | List.cons a as, Nat.succ i, h =>
    have : LT.lt i.succ as.length.succ := List.length_cons .. ▸ h
    get'' as i (Nat.le_of_succ_le_succ this)

def nth' {αs : List Type} : (t : HList αs) → (n : Nat) → (h : n < αs.length := by simp) → List.get'' αs n h
  | HList.nil, n, h => False.elim $ Nat.not_lt_zero _ h
  | HList.cons x xs, 0, h => x
  | HList.cons x xs, (n+1), h => nth' xs n (Nat.le_of_succ_le_succ h)

end Old
