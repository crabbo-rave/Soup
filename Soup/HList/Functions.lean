import Soup.HList.Core
import Soup.HList.Syntax
import Soup.Misc.Fin
import Soup.Misc.List
open Fin'

namespace HList

/-- Returns the first element of a HList -/
def head {α : Type} {αs : List Type} : HList (α :: αs) → α 
  | HList.cons x xs => x

/-- Returns a HList of all the elements besides the first -/
def tail {α : Type} {αs : List Type} : HList (α :: αs) → HList αs
  | HList.cons x xs => xs 

/-- Returns the length of a HList -/
def length {αs : List Type} (_ : HList αs) :=
  αs.length

/-- Returns the nth element of a HList -/
def nth {αs : List Type} : HList αs → (n : Fin' αs.length) → αs.get' n 
  | cons x xs, ⟨0, _⟩ => x
  | cons x xs, ⟨n+1, h⟩ => xs.nth ⟨n, Nat.lt_of_succ_lt_succ h⟩

/- Getting the nth index -/
notation:max p "^" i => nth p #(i)
notation:max p "#" i => nth p #(i)
notation:max p "@" i => nth p #(i)
notation:max p "[" i "]" => nth p #(i)
notation:max p "::" i => nth p #(i)
notation:max p "∧" i => nth p #(i)

def getTypes {αs : List Type} (_ : HList αs) : List Type := 
  αs

end HList
