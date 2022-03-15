import Std
import Soup.Range.Functions

-- set_option quotPrecheck false in
-- notation:max "[" st "..." sp "]" => [st:sp].toList ++ [sp]

syntax "[" term "..." term "]" : term
syntax "[" term "," term "..." term "]" : term
macro_rules
  | `([$st ... $sp]) => `(
    let r := { start := $st, stop := $sp : Std.Range }
    r.toList
  )
  | `([$st,$ste ... $sp]) => `(
    let r := { start := $st, stop := $sp, step := $ste : Std.Range }.toArray
    r.toList
  )