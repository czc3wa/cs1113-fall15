module Person

import Essential

record Person where
    constructor MkPerson
    name : String
    age : Nat
    gender: bool 

-- An example value of type Person
p: Person
p = MkPerson "Tommy" 3 false

q: Person
q = MkPerson "bob" 6 true

r: Person
r = MkPerson "sam" 9 true

s: Person 
s = MkPerson "gar" 10 false

people: list Person
people = (p :: q :: r :: s :: nil)
-- And now here's the key idea: The 
-- names of the fields are automatically
-- names of projection functions! Here
-- we get out the age of person, p.
t: Nat
t = age p
-- expect 3

-- Here we get the name of person p.
n: String
n = name p
-- expect "Tommy"

mapAge: list Person -> list Nat
mapAge nil = nil
mapAge (h::t) = (age h) :: (mapAge t)

ages: list Nat
ages = map age people

names: list String
names = map name people
