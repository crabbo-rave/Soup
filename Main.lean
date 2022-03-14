import Soup

def main : IO Unit :=
  -- IO.println s!"Hello, Heterogenous Lists!"
  IO.println s!"{[1, "2", 1.0, #[1, 2, 3], `[1 2 3]]}"

