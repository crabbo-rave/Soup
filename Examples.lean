import Tuple

#eval ⟪1, 4, 2.4, 'X', [1, 2, 45]⟫ -- ⟪1, 4, 2.4, 'X', [1, 2, 45]⟫
#eval ⟪⟫ -- ⟪⟫

#eval Tuple.length ⟪⟫ -- 0
#eval Tuple.length ⟪1⟫ -- 1
#eval Tuple.length ⟪1, "4", #[1, 5, -2]⟫ -- 3

#eval Tuple.head ⟪1, 2, 3⟫ -- 1
#eval Tuple.tail ⟪1, 2, 3⟫ -- ⟪2, 3⟫

def tuplePatternMatch (tup: Tuple.Tuple [Nat, String]) :=
  match tup with
  | ⟪1, "2"⟫ => true
  | ⟪2, "1"⟫ => true
  | _ => false

#eval tuplePatternMatch ⟪1, "2"⟫ -- true
#eval tuplePatternMatch ⟪1, "3"⟫ -- false
