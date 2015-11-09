module set_specTest

import set_adt
import eq
import serialize
import bool
import nat
import list
import option

-- expecting false
i1: bool
i1 = isEmpty (mkSet ((S O)::(S (S O))::nil))

--expecting mkSet (S O :: O :: S (S O) :: nil)
s1: set nat
s1 =set_insert ((mkSet (O::(S O)::nil))S O) (mkSet (O::(S (S O))::nil))

--expecting mkSet (O::(S (S O))::nil)
s2: set nat
s2 = set_insert O (mkSet (O::(S (S O))::nil))

-- expecting (mkSet (O::(S (S O))::nil))
l1: set nat
l1 = set_remove (S O) (mkSet (O::(S O)::(S (S O))::nil))

-- expecting (mkSet (O::(S (S O))::nil))
l2: set nat
l2 = set_remove (S (S (S O))) (mkSet (O::(S (S O))::nil))

--expecting 3
s3: nat
s3 = set_cardinality (mkSet (O::(S O)::(S (S O))::nil))

--expecting true
s4: bool
s4 = set_member (S O) (mkSet (O::(S O)::(S (S O))::nil))

--expecting false
s5: bool
s5 = set_member (S (S (S O))) (mkSet (O::(S O)::(S (S O))::nil))

--mkSet (O :: S O :: S (S O) :: nil)
c1: set nat
c1 = set_union (mkSet (O::(S O)::(S (S O))::nil)) (mkSet ((S O)::(S (S O))::nil))

--expectin mkSet (S (S O) :: S O :: S (S (S O)) :: S (S (S (S O))) :: nil)
c2: set nat
c2 = set_union (mkSet ((S O)::(S (S O))::nil)) (mkSet ((S (S (S O)))::(S (S (S (S O))))::nil))

--expecting mkSet ( S O :: S (S O) :: nil)
s6: set nat
s6 = set_intersection (mkSet (O::(S O)::(S (S O))::nil)) (mkSet ((S O)::(S (S O))::nil))

--expecting mkSet nil
s7: set nat
s7 = set_intersection (mkSet ((S O)::(S (S O))::nil)) (mkSet ((S (S (S O)))::(S (S (S (S O))))::nil))

--expecting mkSet(O::nil)
s8: set nat
s8 = set_difference (mkSet (O::(S O)::(S (S O))::nil)) (mkSet ((S O)::(S (S O))::nil))

--expecting true
s9: bool
s9 = set_forall evenb (mkSet (O::(S (S O))::nil))

-- expecting false
s10: bool
s10 = set_forall evenb (mkSet (O::(S (S O))::(S (S (S O)))::nil))

--epexcting true
s11:bool
s11 = set_exists evenb (mkSet (O::(S O)::nil))

--expecting false
s12: bool
s12 = set_exists evenb (mkSet ((S O)::(S (S (S O)))::nil))

--expecting some O
s13: option nat
s13 = set_witness evenb (mkSet (O::(S (S O))::nil))

--expecting none
s14: option nat
s14 = set_witness evenb (mkSet ((S O)::nil))

{-expecting mkSet (mkPair O (S (S O)) ::
       mkPair O (S (S (S O))) ::
       mkPair (S O) (S (S O)) :: mkPair (S O) (S (S (S O))) :: nil)mkSet (mkPair O (S (S O)) ::
       mkPair O (S (S (S O))) ::
       mkPair (S O) (S (S O)) :: mkPair (S O) (S (S (S O))) :: nil)-}
       
s15: set (pair a b)
s15 = set_product (mkSet (O::(S O)::nil)) (mkSet ((S (S O))::(S (S (S O)))::nil))
