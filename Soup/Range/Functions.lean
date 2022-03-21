import Soup.Range.Core

open Std

namespace Std.Range

def toArray (r : Range) : Array Nat := Id.run do
  let mut arr := #[]
  for i in r do
    arr := arr.push i
  pure arr

def toList (r : Range) : List Nat := r.toArray.toList

def map (r : Range) (f : Nat → α) : List α := r.toList.map f

end Std.Range
