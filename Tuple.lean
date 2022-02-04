class Nth (α : Type _) (n : Nat) (β : outParam $ Sort _) where
  nth : α → β

namespace Tuple

open Nth

instance (α β : Type _) : Nth (α × β) 0 α where
  nth p := p.1

instance (α β γ : Type _) [Nth β n γ] : Nth (α × β) (n + 1) γ where
  nth p := nth n p.2

@[defaultInstance 0]
instance : Nth α 0 α where
  nth x := x

syntax (name := Tuple) "(" term ";" sepBy1(term, ";", "; ") ")" : term
macro_rules
  | `(($a; $b)) => `(Prod.mk $a $b)
  | `(($a; $b; $xs;*)) => `(Prod.mk $a ($b; $xs;*))

notation:max p "^" i => nth i p
notation:max p "#" i => nth i p
notation:max p "@" i => nth i p
notation:max p "[" i "]" => nth i p
notation:max p "::" i => nth i p
notation:max p "∧" i => nth i p

inductive Tuple where
  | empty : Tuple
  | tuple : Tuple → Tuple

end Tuple