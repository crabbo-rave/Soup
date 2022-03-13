import Soup.HList.Core

/-- HList syntax -/
syntax "⟪" sepBy(term, ",", ", ") "⟫" : term
macro_rules
  | `(⟪⟫) => `(HList.unit)
  | `(⟪$x⟫) => `(HList.cons $x HList.unit)
  | `(⟪$x, $xs,*⟫) => `(HList.cons $x ⟪$xs,*⟫)
  
/- HList.cons notation -/
infixr:65 "!!" => HList.cons
