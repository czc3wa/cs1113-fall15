module testRelation

import relation
import person
import Essential
import Android

--expecting 54
q1: Nat
q1 = query2 people gender age mult 1

-- expecting 1
c1: Nat
c1 = countOne true

--expecting 2
number: Nat
number = query2 people gender countOne plus 0

--expecting 2
c2: Nat
c2 = count_rel people gender

--expecting 15
s1: Nat
s1 = sum_rel people gender age 

--expecting (mkPair 15 2)

a1: pair Nat Nat
a1 = aveAge

--expecting (mkPair 15 2)

a2: pair Nat Nat
a2 = ave_rel people gender age

--expecting 1200

t1: Nat
t1 = totalPrice

--expecting 3

n1: Nat
n1 = numberAndroid

t2: Nat
t2 = totalPrice2

--expecting 12

t3: Nat
t3 = totalVers

--expecting (mkPair 1200 3)

a3: pair Nat Nat
a3 = avePrice

--expecting 6

a4: pair Nat Nat
a4 = aveVers
