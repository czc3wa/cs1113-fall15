module boolTest

import bool
import pair

andp: pair bool bool -> bool
andp (mkPair true true) = true
andp (mkPair _ _) = false

||| a test, expecting true
a1: bool
a1 = andp (mkPair true true) 

||| a test, expecting false
a2: bool
a2 = andp (mkPair true false) 

||| a test, expecting false
a3: bool
a3 = andp (mkPair false true) 

||| a test, expecting false
a4: bool
a4 = andp (mkPair false false) 


por_a_a: bool
por_a_a = por true true
-- expect true

por_b_b: bool
por_b_b = por true false
-- expect true

por_c_c: bool
por_c_c = por false true
--expect true

por_d_d: bool
por_d_d = por false false
-- expect false

pxor_a_a: bool
pxor_a_a = pxor true true
--expect false

pxor_b_b: bool
pxor_b_b = pxor true false
--expect true

pxor_c_c: bool
pxor_c_c = pxor false true
--expect true

pxor_d_d: bool
pxor_d_d = pxor false false
--expect false

pnand_a_a: bool
pnand_a_a = pnand true true
--expect false

pnand_b_b: bool
pnand_b_b = pnand true false
--expect true

pnand_c_c: bool
pnand_c_c = pnand false true
-- expect true

pnand_d_d: bool
pnand_d_d = pnand false false
--expect true







