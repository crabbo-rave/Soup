import Tuple
open Tuple

#eval ⟪1, 4, 2.4, 'X', [1, 2, 45]⟫ -- ⟪1, 4, 2.4, 'X', [1, 2, 45]⟫
#eval ⟪⟫ -- ⟪⟫

#eval ⟪⟫.length -- 0
#eval ⟪1⟫.length -- 1
#eval ⟪1, "4", #[1, 5, -2]⟫.length -- 3

#eval ⟪1, 2, 3⟫.head -- 1
#eval ⟪1, 2, 3⟫.tail -- ⟪2, 3⟫

def tuplePatternMatch (tup: Tuple [Nat, String]) :=
  match tup with
  | ⟪1, "2"⟫ => true
  | ⟪2, "1"⟫ => true
  | _ => false

#eval tuplePatternMatch ⟪1, "2"⟫ -- true
#eval tuplePatternMatch ⟪1, "3"⟫ -- false

def bar := ⟪1, "2", 3.0⟫
#eval bar

def foo : Tuple [Bool, String, Unit] := ⟪true, "hi", ()⟫

#eval foo[0]