# Soup
Extra and extended datatypes for Lean 4

# Use
Go to `lakefile.lean` and add the git repo to your dependencies:
```lean
package PackageName {
  dependencies := #[
    { name := `Soup, src := Source.git "https://github.com/crabbo-rave/Soup.git" "master"}
    ...
  ]
  ...
}
```

# Features
Contains:
- Heterogeneous Lists
- Extra List Functions
- Accessing nth element of Prod
- Range functionality
- Unwrapping Fin type
- Functor instance for Sum
