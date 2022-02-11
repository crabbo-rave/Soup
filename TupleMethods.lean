import Tuple
open Tuple

namespace Tuple

def head {α : Type} {αs : List Type} (tup: Tuple (α :: αs)) : α :=
  match tup with
  | Tuple.cons x xs => x

def tail {α : Type} {αs : List Type} (tup: Tuple (α :: αs)) : Tuple αs :=
  match tup with
  | Tuple.cons x xs => xs

end Tuple