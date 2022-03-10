import Tuple.Core

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

/-- Repr instance for tuples -/
instance (αs : List Type) [TupleRepr (Tuple αs)] : Repr (Tuple αs) where
  reprPrec
  | v, _ => "⟪" ++ TupleRepr.repr v ++ "⟫"

class TupleString (α : Type _) where
  toString: α → String

instance : TupleString (Tuple []) where
  toString
  | Tuple.unit => ""

instance [ToString α] (αs : List Type) [TupleString (Tuple αs)] : TupleString (Tuple (α :: αs)) where
  toString
  | Tuple.cons x xs =>
    match xs with
    | Tuple.unit => toString x
    | Tuple.cons _ _ => toString x ++ ", " ++ TupleString.toString xs 

/-- ToString instance for tuples -/
instance (αs : List Type) [TupleString (Tuple αs)] : ToString (Tuple αs) where
  toString : Tuple αs → String
  | t => "⟪" ++ TupleString.toString t ++ "⟫"
    