import Std
import Soup.Range.Functions

-- set_option quotPrecheck false in
-- notation:max "[" st "..." sp "]" => [st:sp].toList ++ [sp]

syntax "[" term "..." term "]" : term
macro_rules
  | `([$st ... $sp]) => `(
    { start := $st, stop := $sp : Std.Range }.toList ++ [$sp]
  )

#eval [1 ... 5]