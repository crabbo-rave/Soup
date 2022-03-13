import Soup
open HList

-- Evaluate HLists
#eval ⟪1, 4, 2.4, 'X', [1, 2, 45]⟫ -- ⟪1, 4, 2.4, 'X', [1, 2, 45]⟫
#eval ⟪⟫ -- ⟪⟫

-- cons 1 (cons 4 (cons 2.4 (cons (Char.ofNat 88) (cons [1, 2, 45] unit)))) 
-- : HList [Nat, Nat, Float, Char, List Nat]
#check ⟪1, 4, 2.4, 'X', [1, 2, 45]⟫ 
#check ⟪⟫ -- unit : HList []

-- Get the lengths
#eval ⟪⟫.length -- 0
#eval ⟪1⟫.length -- 1
#eval ⟪1, "4", #[1, 5, -2]⟫.length -- 3

-- get the head and tail
#eval ⟪1, 2, 3⟫.head -- 1
#eval ⟪1, 2, 3⟫.tail -- ⟪2, 3⟫

-- Functions can return HLists
def bar : HList [Nat, String, Float] := ⟪1, "2", 3.0⟫
#eval bar

-- Functions and pattern matching
def HListPatternMatch (tup: HList [Nat, String]) :=
  match tup with
  | ⟪1, "2"⟫ => true
  | ⟪2, "1"⟫ => true
  | _ => false

#eval HListPatternMatch ⟪1, "2"⟫ -- true
#eval HListPatternMatch ⟪1, "3"⟫  -- false

-- Getting nth item. Start at 0
#eval ⟪1,"2",3.0⟫.nth #(1) -- "2"
#eval ⟪1,"2",3.0⟫#1
#eval ⟪1,"2",3.0⟫@1
#eval ⟪1,"2",3.0⟫[1]
#eval ⟪1,"2",3.0⟫::1
#eval ⟪1,"2",3.0⟫∧1

#eval toString ⟪1, "2", 3.0, [4, 5, 6], #[7, 8]⟫
#eval toString ⟪⟫

#eval 1 !! ⟪1, 5, 4⟫