import Soup.Range.Core

namespace Std.Range

def toArray (r : Std.Range) : Array Nat := Id.run do
  let mut arr := #[]
  for i in r do
    arr := arr.push i
  pure arr

def toList (r : Std.Range) : List Nat := r.toArray.toList

end Std.Range

namespace Range'



end Range'