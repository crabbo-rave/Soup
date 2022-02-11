import Tuple
open Tuple

def tuplePatternMatch (tup: Tuple [Nat, Nat]) :=
  match tup with
  | ⟪1, 2⟫ => true
  | ⟪2, 1⟫ => true
  | _ => false

#eval tuplePatternMatch ⟪1, 2⟫
#eval tuplePatternMatch ⟪1, 3⟫

#eval head ⟪1, 2, 3⟫