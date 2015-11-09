--binary functions implicit

andd: bool -> bool -> bool
andd true true = true
andd _ _ = false

uf: bool -> bool
uf = andd true

ord: bool -> bool -> bool
ord false false = false
ord _ _ = true

add: nat -> nat -> nat
add O m = m
add (S n) m = S(add n m)
