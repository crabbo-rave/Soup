/-- Inductive definition for HList -/
inductive HList : List Type → Type 1 where
  | unit : HList []
  | cons {α : Type} (x : α) {αs : List Type} (xs : HList αs) : HList (α :: αs)
