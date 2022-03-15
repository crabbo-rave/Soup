import Soup.Range.Functions

set_option quotPrecheck false in
notation:max "[" st "..." sp "]" => [st:sp].toList ++ [sp]
