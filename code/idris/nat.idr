module nat

import bool
import pair
import eq
import serialize

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


eql_nat: nat -> nat -> bool
eql_nat O O = true
eql_nat O (S b) = false
eql_nat (S a) O = false
eql_nat (S a) (S b) = eql_nat a b

instance eq nat where
  eql n1 n2 = eql_nat n1 n2
  
instance Serialize nat where
  toString O = "Z"
  toString (S n) = "s" ++ (toString n)
