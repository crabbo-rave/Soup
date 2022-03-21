import Soup.HList.Core
import Soup.HList.Functions

class HListRepr (α : Type _) where
  repr: α → Std.Format

instance : HListRepr (HList []) where
  repr
  | HList.nil => ""

instance [Repr α] (αs : List Type) [HListRepr (HList αs)] : HListRepr (HList (α :: αs)) where
  repr
  | HList.cons x xs =>
    match xs with
    | HList.nil => reprPrec x 0
    | HList.cons x' xs' => reprPrec x 0 ++ ", " ++ HListRepr.repr xs

/-- Repr instance for HLists -/
instance (αs : List Type) [HListRepr (HList αs)] : Repr (HList αs) where
  reprPrec
  | v, _ => "[" ++ HListRepr.repr v ++ "]"

class HListString (α : Type _) where
  toString : α → String

instance : HListString (HList []) where
  toString
  | HList.nil => ""

instance [ToString α] (αs : List Type) [HListString (HList αs)] : HListString (HList (α :: αs)) where
  toString
  | HList.cons x xs =>
    match xs with
    | HList.nil => toString x
    | HList.cons _ _ => toString x ++ ", " ++ HListString.toString xs 

/-- ToString instance for HLists -/
instance (αs : List Type) [HListString (HList αs)] : ToString (HList αs) where
  toString : HList αs → String
  | t => "[" ++ HListString.toString t ++ "]"
    