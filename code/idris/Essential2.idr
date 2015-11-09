module Essential

data unit = mkUnit


unit_id: unit -> unit
unit_id mkUnit = mkUnit

data bool = true | false

id_bool: bool -> bool
id_bool  b = b

constFalse: bool -> bool
constFalse _ = false

constTrue: bool -> bool
constTrue _ = true

not: bool -> bool
not true = false
not _ = true

and: bool -> bool -> bool
and true true = true
and _ _ = false

or: bool -> bool -> bool
or false false = false
or _ _ = true

nand: bool -> bool -> bool
nand true true = false
nand _ _ = true

xor: bool -> bool -> bool
xor true false = true
xor false true = true
xor _ _ = false

data nat = O | S nat

evenb: nat -> bool
evenb O = true
evenb (S O) = false
evenb (S (S n)) = evenb n

add: nat -> nat -> nat
add O m = m
add (S n) m = S (add n m)

mult: nat -> nat -> nat
mult O m = O
mult (S n) m = add m (mult n m)

fact: nat -> nat 
fact O = (S O)
fact (S n) = mult (S n) (fact n)

sub: nat -> nat -> nat
sub O a = O
sub a O = a
sub (S a) (S b) = sub a b

exp: nat -> nat -> nat
exp O n = O
exp x O = S O
exp x (S n) = mult (exp x n) x

lep: nat -> nat -> bool
lep O b = true
lep (S a) O = false
lep (S a) (S b) = lep a b

eqp: nat -> nat -> bool
eqp O O = true
eqp O (S b) = false
eqp (S a) O = false
eqp (S a) (S b) = eqp a b

gtp: nat -> nat -> bool
gtp (S a) O = true
gtp O b = false
gtp (S a) (S b) = gtp a b

gep: nat -> nat -> bool
gep O O = true
gep (S a) O = true
gep O (S b) = false
gep (S a) (S b) = gep a b

ltp: nat -> nat -> bool
ltp a O = false
ltp (S a) O = false
ltp O (S b) = true
ltp (S a) (S b) = ltp a b 

data pair a b = mkPair a b 

fst: pair a b -> a
fst (mkPair f s) = f

snd: pair a b -> b
snd (mkPair f s) = s

data option t = some t | none

o1: option bool 
o1 = none

o2: option bool
o2 = some true

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

query: (value -> value -> value) -> value -> 
         (tuple -> value) -> (tuple -> bool) -> 
            (list tuple) -> value
query reduce id project select relation =
       list.foldr reduce id (map project (filter select relation))
