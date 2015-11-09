module listTest

import list
import eq
import nat
import setTest


{- --expecting true :: false :: true :: true :: nil
maptest : list bool
maptest = map evenb (O::(S O)::(S (S O))::(S (S (S (S O))))::nil)

--expecting O :: S (S O) :: S (S (S (S O))) :: nil
filtertest: list nat
filtertest = filter evenb (O::(S O)::(S (S O))::(S (S (S (S O))))::nil) -}

isThree: bool
isThree = (member (S (S (S O))) l2)

s: String
s = toString (O::O::O::O::nil)
