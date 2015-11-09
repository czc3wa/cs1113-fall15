module list

import nat
import bool
import eq
import serialize

data list a = nil | (::) a (list a)

length: list a -> nat
length nil = O
length (n :: l) = S (length l) 

(++): list a  -> list a -> list a
(++) nil m = m
(++) (n :: l) m = n :: (l ++ m)

ite: bool -> a -> a -> a
ite true tb fb = tb
ite false tb fb = fb


map: (a -> b) -> list a -> list b
map f nil = nil
map f (h::t) = (f h) :: (map f t) 

filter: (a -> bool) -> list a -> list a
filter f nil = nil
filter f (h::t) = ite (f h)
                      (h::(filter f t))
                          (filter f t)
fancyplus: list nat -> nat
fancyplus nil = O
fancyplus (h::t) = add h (fancyplus t)

list.foldr: (a -> a -> a) -> a -> list a -> a
list.foldr f id nil = id
list.foldr f id (h::t) = f h (list.foldr f id t)


member: (eq a) => a -> list a -> bool
member v nil = false
member v (h::t) = ite (eql v h)
                      true
                      (member v t)

subset_elements: (eq a) => list a -> list a -> bool
subset_elements nil l = true
subset_elements (h1::t1) l = ite (member h1 l) 
                                 (subset_elements t1 l)
                                 false


same_elements: (eq a) => list a -> list a -> bool
same_elements l1 l2 = ite (subset_elements l1 l2) 
                          (subset_elements l2 l1)
                          false

instance (eq a) =>  eq (list a) where
  eql nil nil = true
  eql (h::t) nil = false
  eql nil (h::t) = false
  eql (h1::t1) (h2::t2) = 
    and (eql h1 h2) (eql t1 t2)
    
toStringlist: (Serialize a) => list a -> String
toStringlist nil = ""
toStringlist (h::nil) = (toString h) 
toStringlist (h::t) = (toString h) ++ ", " ++ (toStringlist t)

instance (Serialize a) =>  Serialize (list a) where
  toString nil = "[]"
  toString l = "[" ++ (toStringlist l)  ++ "]"
  
  

