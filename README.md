# lean4-Tuple
Tuples for lean 4

# Use
Go to `lakefile.lean` and add the git repo to your dependencies:
```lean
package PackageName {
  dependencies := #[
    { name := `Tuple, src := Source.git "https://github.com/crabbo-rave/lean4-Tuple.git" "master"}
    ...
  ]
  ...
}
```

# Syntax
Check `Examples.lean` for all the syntax.

To use tuples, at the top of your file, put 
```lean
import Tuple
open Tuple
```

The tuple syntax looks like this:
```lean
#eval ⟪1, 4, 2.4, 'X', [1, 2, 45]⟫ -- ⟪1, 4, 2.4, 'X', [1, 2, 45]⟫
#eval ⟪⟫ -- ⟪⟫
```

And are essentially a list of types:
```lean
-- cons 1 (cons 4 (cons 2.4 (cons (Char.ofNat 88) (cons [1, 2, 45] unit)))) 
-- : Tuple [Nat, Nat, Float, Char, List Nat]
#check ⟪1, 4, 2.4, 'X', [1, 2, 45]⟫ 
#check ⟪⟫ -- unit : Tuple []
```

If needed, you can convert them to strings:
```lean
#eval toString ⟪1, 4, 2.4, 'X', [1, 2, 45]⟫ -- "⟪1, 4, 2.4, 'X', [1, 2, 45]⟫"
#eval toString ⟪⟫ -- "⟪⟫"
```

You can get the length of them:
```lean
#eval ⟪⟫.length -- 0
#eval ⟪1⟫.length -- 1
#eval ⟪1, "4", #[1, 5, -2]⟫.length -- 3
```

As well as the head and tail:
```lean
#eval ⟪1, 2, 3⟫.head -- 1
#eval ⟪1, 2, 3⟫.tail -- ⟪2, 3⟫
```

Tuples are able to be used as function parameters and can be matched on:
```lean
def tuplePatternMatch (tup: Tuple [Nat, String]) :=
  match tup with
  | ⟪1, "2"⟫ => true
  | ⟪2, "1"⟫ => true
  | _ => false

#eval tuplePatternMatch ⟪1, "2"⟫ -- true
#eval tuplePatternMatch ⟪1, "3"⟫ -- false
```

You can also get the `nth` item in many different ways:
```lean
#eval ⟪1,"2",3.0⟫.nth 1 -- "2"
#eval ⟪1,"2",3.0⟫#1
#eval ⟪1,"2",3.0⟫@1
#eval ⟪1,"2",3.0⟫[1]
#eval ⟪1,"2",3.0⟫::1
#eval ⟪1,"2",3.0⟫∧1
```

Lastly, probably the most powerful feature of these is that they dont have to of a fixed size when used as arguments. For instance, here is the length function:
```lean
def length {αs : List Type} (tup : Tuple (αs)) : Nat :=
  let rec lengthAux {αs : List Type} (tup: Tuple (αs)) (length: Nat) : Nat :=
    match tup with
    | Tuple.unit => length
    | Tuple.cons _ xs => lengthAux xs (length + 1)
  match tup with
  | ⟪⟫ => 0
  | _ => lengthAux tup 0
  ```
