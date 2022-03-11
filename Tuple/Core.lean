/-- Inductive definition for Tuple -/
inductive Tuple : List Type → Type 1 where
  | unit : Tuple []
  | cons {α : Type} (x : α) {αs : List Type} (xs : Tuple αs) : Tuple (α :: αs)
