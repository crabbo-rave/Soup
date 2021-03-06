import Soup
open HList

def single : HList [Nat] := [1]
def tri : HList [Nat, Nat, Nat] := [1, 2, 3]

-- Evaluate HLists
#eval [1, 4, 2.4, 'X', [1, 2, 45]] -- [1, 4, 2.4, 'X', [1, 2, 45]]
#eval HList.nil -- []

-- cons 1 (cons 4 (cons 2.4 (cons (Char.ofNat 88) (cons [1, 2, 45] unit)))) 
-- : HList [Nat, Nat, Float, Char, List Nat]
#check [1, 4, 2.4, 'X', [1, 2, 45]] 
#check HList.nil-- unit : HList []

-- Get the lengths
#eval HList.nil -- 0
#eval single.length -- 1
#eval [1, "4", #[1, 5, -2]].length -- 3

-- get the head and tail
#eval tri.head -- 1
#eval tri.tail -- [2, 3]

-- Functions can return HLists
def bar : HList [Nat, String, Float] := [1, "2", 3.0]
#eval bar

-- Functions and pattern matching
def HListPatternMatch (l: HList [Nat, String]) :=
  match l with
  | [1, "2"] => true
  | [2, "1"] => true
  | _ => false

#eval HListPatternMatch [1, "2"] -- true
#eval HListPatternMatch [1, "3"]  -- false

-- Getting nth item. Start at 0
#eval HList.nth [1,"2",3.0] #1-- "2"
#eval [1,"2",3.0][#1]

#eval toString [1, "2", 3.0, [4, 5, 6], #[7, 8]]
#eval toString HList.nil

def baz : HList [Nat, String, Float, Char] := 
  1 :: ["1", 5.4, '4']

#eval baz

#eval [1 ... 4]
#eval [5 ... 1]
#eval [5,3 ... 20]
#eval [5:8].toList

-- def foo : Fin 5 := #7
-- def foo' : List Nat := `[1 2 3 4 5]

-- open List
-- #eval foo'.get' foo

def foo : HList [Int, String, Nat] := [-4, "cool", 28]

def the (α : Type u) (a : α) := a

#eval the (HList [Int, String, Nat]) (foo.mapNth 0 (·*-1))

-- #eval foo.mapNth 0 (·*-1)

def f {αs : List Type} : HList αs → (h : (αs.length = 3) || (αs.length = 5) := by simp) → Nat
  | a, _ => a.length
#eval [1, 2, 3, 4, 5][#3]

#eval let n := [1, "3", 7.2, 1]; f n

#eval ([1, 2, 3, 4, 5] : List Nat).get (7 : Fin 5)
#eval ([1, 2, 3, 4, 5] : List Nat).get' #2