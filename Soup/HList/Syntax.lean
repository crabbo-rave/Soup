import Soup.HList.Core

/-- HList syntax -/
syntax (name := hlist) "[" term,* "]" : term
macro_rules (kind := hlist)
  | `([]) => `(HList.nil)
  | `([$x]) => `(HList.cons $x HList.nil)
  | `([$x, $xs,*]) => `(HList.cons $x [$xs,*])
  
/- HList.cons notation -/
infixr:67 " :: " => HList.cons