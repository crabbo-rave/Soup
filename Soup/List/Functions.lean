import Soup.Misc
open Fin'

namespace List

@[reducible] def get' {α : Type u} : (as : List α) → (i : Fin' as.length) → α
  | a::_, ⟨0, _⟩ => a 
  | _::as, ⟨i+1, h⟩ => as.get' ⟨i, Nat.lt_of_succ_lt_succ h⟩

end List
