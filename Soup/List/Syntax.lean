syntax (name := clean_list) "`[" term* "]" : term
macro_rules (kind := clean_list)
  | `(`[]) => `(List.nil)
  | `(`[$a $as*]) => `(List.cons $a [$as,*])