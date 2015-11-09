module testage


import list

mapAge: list Person -> list Nat
mapAge nil = nil
mapAge (h::t) = (age h) :: (mapAge t)

mapAge (p :: q :: r :: s :: nil) = (age p) :: (mapAge q :: r :: s :: nil)
mapAge (q ::r :: s :: nil) = (age p) :: (age q) :: (mapAge r :: s :: nil)
mapAge (r :: s :: nil) = (age p) :: (age q) :: (age r) :: (mapAge s :: nil) 
mapAge (s :: nil) = (age p) :: (age q) :: (age r) :: (age s) :: (mapAge nil)
mapAge (s :: nil) = (age p) :: (age q) :: (age r) :: (age s) :: nil
