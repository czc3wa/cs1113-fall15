module friend

import bool

||| a friend is someone who is or isnt trustworthy, who has a name
||| has an age in years

data friend = mkFriend bool String Nat

bob: friend
bob = mkFriend true "bob" 20

getAge: friend -> Nat
getAge (mkFriend b s n) = n

getName: friend -> String
getName (mkFriend b s n) = s

getTrust: friend -> bool
getTrust (mkFriend b s n) = b


