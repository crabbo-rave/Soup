import Soup.HList.Core

class TupleRepr (α : Type _) where
  repr: α → Std.Format

instance : TupleRepr (HList []) where
  repr
  | HList.unit => ""

instance [Repr α] (αs : List Type) [TupleRepr (HList αs)] : TupleRepr (HList (α :: αs)) where
  repr
  | HList.cons x xs =>
    match xs with
    | HList.unit => reprPrec x 0
    | HList.cons x' xs' => reprPrec x 0 ++ ", " ++ TupleRepr.repr xs

/-- Repr instance for tuples -/
instance (αs : List Type) [TupleRepr (HList αs)] : Repr (HList αs) where
  reprPrec
  | v, _ => "⟪" ++ TupleRepr.repr v ++ "⟫"

class TupleString (α : Type _) where
  toString: α → String

instance : TupleString (HList []) where
  toString
  | HList.unit => ""

instance [ToString α] (αs : List Type) [TupleString (HList αs)] : TupleString (HList (α :: αs)) where
  toString
  | HList.cons x xs =>
    match xs with
    | HList.unit => toString x
    | HList.cons _ _ => toString x ++ ", " ++ TupleString.toString xs 

/-- ToString instance for tuples -/
instance (αs : List Type) [TupleString (HList αs)] : ToString (HList αs) where
  toString : HList αs → String
  | t => "⟪" ++ TupleString.toString t ++ "⟫"
    