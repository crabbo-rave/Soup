import Soup.Misc
open Fin'

namespace List

@[reducible] def get' {α : Type u} : (as : List α) → Fin' as.length → α
  | a::_, ⟨0, _⟩ => a 
  | _::as, ⟨i+1, h⟩ => as.get' ⟨i, Nat.lt_of_succ_lt_succ h⟩

def replaceAt : (as : List α) → Fin' as.length → α → List α
  | _::xs, ⟨0, _⟩, y => y :: xs
  | x::xs, ⟨i+1, h⟩, y => x :: xs.replaceAt ⟨i, Nat.lt_of_succ_lt_succ h⟩ y 

def tail : List α → List α 
  | [] => []
  | a::as => as

end List
