import Tuple
open Tuple

def tuplePatternMatch (tup: Tuple) :=
  match tup with
  | (1; 2) => true
  | (2; 1) => true
  | _ => false