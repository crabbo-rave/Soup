import Soup.HList.HList
import Soup.Misc.List

/- Collection of older versions of functions worth keeping. -/
namespace Old

def nth' {αs : List Type} : (t : HList αs) → (n : Nat) → (h : n < αs.length := by simp) → αs.get' n h
  | HList.nil, n, h => False.elim $ Nat.not_lt_zero _ h
  | HList.cons x xs, 0, h => x
  | HList.cons x xs, (n+1), h => xs.nth n (Nat.le_of_succ_le_succ h)