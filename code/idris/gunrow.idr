module gunrow

import list

data country  = Argentina | Australia | Austria | Honduras | USA

||| A record of this type represents a country and the death rate per 10,000,000 by gun for homocides, suicides, unintentional, other deaths

data gunrow = mkGunrow country Nat Nat Nat Nat

argentina: gunrow
argentina = mkGunrow Argentina 190 279 64 362

australia: gunrow 
australia = mkGunrow Australia 11 62 5 8

austria: gunrow
austria = mkGunrow Austria 18 268 1 8

honduras: gunrow
honduras = mkGunrow Honduras 648 0 0 0

usa: gunrow
usa = mkGunrow USA 355 670 16 9

countryDeaths: list gunrow
countryDeaths = cons argentina (cons australia (cons austria (cons honduras (cons usa nil))))

countryName: gunrow -> country
countryName (mkGunrow c h s u o) = c

homicidePer10M: gunrow -> Nat
homicidePer10M (mkGunrow c h s u o) = h

suicidePer10M: gunrow -> Nat
suicidePer10M (mkGunrow c h s u o) = s

unintentionalPer10M: gunrow -> Nat
unintentionalPer10M (mkGunrow c h s u o) = u

otherdeathPer10M: gunrow -> Nat
otherdeathPer10M (mkGunrow c h s u o) = o

