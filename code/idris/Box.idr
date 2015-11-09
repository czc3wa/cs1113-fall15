module Box

import eq
import serialize

data Box t = mkBox t

unbox: Box t -> t
--box becomes  a type constructor
--t becomes type parameter
unbox (mkBox b) = b

instance (eq a) => eq (Box a) where
  eql (mkBox v1) (mkBox v2) = eql v1 v2
  
instance (Serialize a) => Serialize (Box a) where
  toString (mkBox b) = "(" ++ (toString b) ++ ",)"
