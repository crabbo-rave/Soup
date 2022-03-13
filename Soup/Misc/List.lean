import Soup.Misc.Fin
open Fin'

section ListEx

namespace List

@[reducible] def get' {α : Type u} : (as : List α) → (i : Fin' as.length) → α
  | a::as, ⟨0, _⟩ => a 
  | a::as, ⟨i+1, h⟩ => as.get' ⟨i, Nat.lt_of_succ_lt_succ h⟩