namespace Prod

class Nth (α : Type _) (n : Nat) (β : outParam $ Sort _) where
  nth : α → β

open Nth

instance (α β : Type _) : Nth (α × β) 0 α where
  nth p := p.1

instance (α β γ : Type _) [Nth β n γ] : Nth (α × β) (n + 1) γ where
  nth p := nth n p.2

@[defaultInstance 0]
instance : Nth α 0 α where
  nth x := x

notation:max p "." i => nth i p

end Prod
