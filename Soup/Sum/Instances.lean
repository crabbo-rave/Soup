import Soup.Sum.Functions

instance : Functor (Sum α) where
  map := Sum.map
