module dnaTest

import dna

-- expecting T
c1: base
c1 = complement_base A

--expecting A
c2: base
c2 = complement_base T

--expecting C
c3: base
c3 = complement_base G

--expecting G
c4: base
c4 = complement_base C
