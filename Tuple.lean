class Nth (α : Type _) (n : Nat) (β : outParam $ Sort _) where
  nth : α → β

namespace Tuple

open Nth

-- instance (α β : Type _) : Nth (α × β) 0 α where
--   nth p := p.1

-- instance (α β γ : Type _) [Nth β n γ] : Nth (α × β) (n + 1) γ where
--   nth p := nth n p.2

-- @[defaultInstance 0]
-- instance : Nth α 0 α where
--   nth x := x

inductive Tuple : List Type → Type 1 where
  | unit : Tuple []
  | cons {α : Type} (x : α) {αs : List Type} (xs : Tuple αs) : Tuple (α :: αs)

syntax "⟪" sepBy(term, ",", ", ") "⟫" : term
macro_rules
  | `(⟪⟫) => `(Tuple.unit)
  | `(⟪$x⟫) => `(Tuple.cons $x Tuple.unit)
  | `(⟪$x, $xs,*⟫) => `(Tuple.cons $x ⟪$xs,*⟫)

-- notation:max p "^" i => nth i p
-- notation:max p "#" i => nth i p
-- notation:max p "@" i => nth i p
-- notation:max p "[" i "]" => nth i p
-- notation:max p "::" i => nth i p
-- notation:max p "∧" i => nth i p

end Tuple