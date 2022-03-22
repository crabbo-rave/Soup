import Soup.HList.Core
import Soup.HList.Syntax
import Soup.Misc.Fin
import Soup.List
open Fin'

namespace HList

/-- Returns the first element of a HList -/
def head {α : Type} {αs : List Type} : HList (α :: αs) → α 
  | x::_ => x

/-- Returns a HList of all the elements besides the first -/
def tail {α : Type} {αs : List Type} : HList (α :: αs) → HList αs
  | _::xs => xs 

/-- Returns the length of a HList -/
def length {αs : List Type} (_ : HList αs) :=
  αs.length

/-- Returns the nth element of a HList -/
@[reducible] def nth {αs : List Type} : HList αs → (n : Fin αs.length) → αs.get' n 
  | x::_, ⟨0, _⟩ => x
  | _::xs, ⟨n+1, h⟩ => xs.nth ⟨n, Nat.lt_of_succ_lt_succ h⟩

/- Getting the nth index -/
notation:90 p "[" i "]" => nth p #i

def getTypes {αs : List Type} (_ : HList αs) : List Type := 
  αs

def mapNthNoMetaEval : (n : Fin' αs.length) → ((αs.get' n) → β) → HList αs → HList (αs.replaceAt n β)
  | ⟨0, _⟩, f, a::as => (f a)::as
  | ⟨n+1, h⟩, f, a::as => a::(as.mapNthNoMetaEval ⟨n, Nat.lt_of_succ_lt_succ h⟩ f)

private def the (α : Type u) (a : α) := a

def mapNth (n : Fin' αs.length) (f : (αs.get' n) → β) (h : HList αs) : HList (αs.replaceAt n β) :=
  let typeSig : List Type := αs.replaceAt n β
  the (HList typeSig) (h.mapNthNoMetaEval n f)

end HList
