namespace String

def String.reverse := (String.intercalate "") ∘ (List.map toString) ∘ List.reverse ∘ String.toList

end String