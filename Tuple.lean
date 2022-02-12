inductive Tuple : List Type → Type 1 where
  | unit : Tuple []
  | cons {α : Type} (x : α) {αs : List Type} (xs : Tuple αs) : Tuple (α :: αs)

namespace Tuple

syntax "⟪" sepBy(term, ",", ", ") "⟫" : term
macro_rules
  | `(⟪⟫) => `(Tuple.unit)
  | `(⟪$x⟫) => `(Tuple.cons $x Tuple.unit)
  | `(⟪$x, $xs,*⟫) => `(Tuple.cons $x ⟪$xs,*⟫)

class TupleRepr (α : Type _) where
  repr: α → Std.Format

instance : TupleRepr (Tuple []) where
  repr
  | Tuple.unit => ""

instance [Repr α] (αs : List Type) [TupleRepr (Tuple αs)] : TupleRepr (Tuple (α :: αs)) where
  repr
  | Tuple.cons x xs =>
    match xs with
    | Tuple.unit => reprPrec x 0
    | Tuple.cons x' xs' => reprPrec x 0 ++ ", " ++ TupleRepr.repr xs

instance (αs : List Type) [TupleRepr (Tuple αs)] : Repr (Tuple αs) where
  reprPrec
  | v, _ => "⟪" ++ TupleRepr.repr v ++ "⟫"

-- notation:max p "^" i => nth i p
-- notation:max p "#" i => nth i p
-- notation:max p "@" i => nth i p
-- notation:max p "[" i "]" => nth i p
-- notation:max p "::" i => nth i p
-- notation:max p "∧" i => nth i p

def head {α : Type} {αs : List Type} (tup: Tuple (α :: αs)) : α :=
  match tup with
  | Tuple.cons x xs => x

def tail {α : Type} {αs : List Type} (tup: Tuple (α :: αs)) : Tuple αs :=
  match tup with
  | Tuple.cons x xs => xs

def length {αs : List Type} (tup: Tuple (αs)) : Nat :=
  let rec lengthAux {αs : List Type} (tup: Tuple (αs)) (length: Nat) : Nat :=
    match tup with
    | Tuple.unit => length
    | Tuple.cons _ xs => lengthAux xs (length + 1)
  match tup with
  | ⟪⟫ => 0
  | _ => lengthAux tup 0

def nth {α : Type} {αs : List Type} (tup: Tuple (α :: αs)) (n: Nat) :=
  let rec nthAux {α : Type} {αs : List Type} {β : Type} : (tupRest: Tuple (α :: αs)) → (n: Nat) → α
    | (Tuple.cons x xs), 0 => x
    | (Tuple.cons _ xs), n+1 => nthAux (xs) n
  nthAux tup n

end Tuple