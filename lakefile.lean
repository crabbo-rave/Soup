import Lake
open Lake DSL

package Soup {
  dependencies := #[
    { 
      name := `mathlib, 
      src := Source.git "https://github.com/leanprover-community/mathlib4.git" "master"
    }
  ]
}
