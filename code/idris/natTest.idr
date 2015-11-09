module nat

import bool
import pair

data nat = O | S nat

addp: pair nat nat -> nat
addp (mkPair O m) = m
addp (mkPair (S n) m) = S (addp (mkPair n m))

||| given a pair of natural numbers, return its product
multp: pair nat nat -> nat
multp (mkPair O m) = O
multp (mkPair (S n) m) = addp (mkPair m (multp (mkPair n m)))

||| given a natural number, return its factorial
factp: nat -> nat
factp O = S O
factp (S n) = multp (mkPair (S n) (factp n))

||| given a pair of natural numbers, (a, b), return a-b

subp: pair nat nat -> nat
subp (mkPair O a) = O
subp (mkPair a O) = a
subp (mkPair (S a) (S b)) = subp (mkPair a b)

|||5) given a pair of natural numbers, (x, n), return the value of x raised to the nth power

exp: pair nat nat -> nat
exp (mkPair O n) = O
exp (mkPair x O) = S O
exp (mkPair x (S n)) = multp (mkPair (exp (mkPair x n)) x)

||| a test, expecting (S (S (S (S (S (S (S (S  O))))))))
a1: nat
a1 = exp (mkPair (S (S O)) (S (S (S O))))

||| a test, expecting O
a2: nat
a2 = exp (mkPair O (S (S (S O))))

-- given a pair of natural numbers, (a, b), return true if a is less than or equal to b, otherwise return false
 
lep: pair nat nat -> bool
lep (mkPair O b) = true
lep (mkPair (S a) O) = false
lep (mkPair (S a) (S b)) = lep (mkPair a b)

||| a test, expecting true
b1: bool
b1 = lep (mkPair (S (S (S (S O)))) (S (S (S (S O)))))

||| a test, expecting true
b2: bool
b2 = lep (mkPair (S (S O)) (S (S (S (S (S (S O)))))))

||| a test, expecting false
b3: bool
b3 = lep (mkPair (S (S (S (S O)))) (S O))


||| given a pair of natural numbers, (a, b), return true if a is equal to b, otherwise return false
eqp: pair nat nat -> bool
eqp (mkPair O O ) = true
eqp (mkPair O (S b)) = false
eqp (mkPair (S a) O) = false
eqp (mkPair (S a) (S b) ) = eqp (mkPair a b)

||| a test, expecting true
c1: bool
c1 = eqp (mkPair (S (S (S (S O)))) (S (S (S (S O)))))

||| a test, expecting false
c2: bool
c2 = eqp (mkPair (S (S (S (S O)))) (S (S O)))

||| a test, expecting false
c3: bool
c3 = eqp (mkPair (S O) (S (S (S O))))


-- gtp given a pair of natural numbers, (a, b), return true if a is greater than b, otherwise return false

gtp: pair nat nat -> bool
gtp (mkPair (S a) O) = true
gtp (mkPair O b) = false
gtp (mkPair (S a) (S b)) = gtp (mkPair a b)
 
-- given a pair of natural numbers, (a, b), return true of a is greater than or equal to b

gep: pair nat nat -> bool
gep (mkPair O O) = true
gep (mkPair (S a) O) = true
gep (mkPair O (S b)) = false
gep (mkPair (S a) (S b)) = gep (mkPair a b)

ltp: pair nat nat -> bool
ltp (mkPair a O) = false
ltp (mkPair (S a) O) = false
ltp (mkPair O (S b)) = true
