import Lake
open Lake DSL

package Soup {
  dependencies := #[
    { 
      name := `mathlib, 
      src := Source.git "https://github.com/leanprover-community/mathlib4.git" "260cceb2bd29e5f2f67bd55335d3cb8a5397416f"
    }
  ]
}
