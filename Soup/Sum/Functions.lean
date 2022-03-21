namespace Sum

def either (f₁ : α → γ) (f₂ : β → γ) : α ⊕ β → γ
  | inl a => f₁ a
  | inr b => f₂ b

def map (f : β → γ) : α ⊕ β → α ⊕ γ
  | inr x => inr $ f x
  | inl x => inl x

end Sum
