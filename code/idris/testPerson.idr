module testPerson

import bool
import list

map: (a -> b) -> list a -> list b
map f nil = nil
map f (h::t) = (f h)::(map f t)
