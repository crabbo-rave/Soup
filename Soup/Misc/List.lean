import Soup.Misc.Fin
open Fin'

section CleanList

syntax (name := clean_list) "`[" term* "]" : term
macro_rules (kind := clean_list)
  | `(`[]) => `(List.nil)
  | `(`[$a $as*]) => `(List.cons $a [$as,*])

end CleanList

section ListEx

namespace List

@[reducible] def get' {α : Type u} : (as : List α) → (i : Fin' as.length) → α
  | a::as, ⟨0, _⟩ => a 
  | a::as, ⟨i+1, h⟩ => as.get' ⟨i, Nat.lt_of_succ_lt_succ h⟩

end List

end ListEx

#eval [1, 2, 3, 4, 5]

