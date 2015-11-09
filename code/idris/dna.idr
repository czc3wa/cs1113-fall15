module dna

import Essential

data base = A | T | G | C

complement_base: base -> base
complement_base A = T
complement_base T = A
complement_base G = C
complement_base _ = G


--Write a function called complement_strand that takes a list base (representing a DNA strand) and that returns the complementary strand (the strand of bases complementary to those in the given list). Your function must work by using map and complement_base. 

complement_strand: list base -> list base
complement_strand (h::t) = map complement_base (h::t)

strand1: list (pair base base) -> list base
strand1 nil = nil
strand1 ((mkPair a b):: t) = (a::strand1 t)

strand2: list (pair base base) -> list base
strand2 nil = nil
strand2 ((mkPair a b):: t) = (b::strand2 t)

complete: list base -> list (pair base base)
complete nil = nil
complete (h::t) = (mkPair h (complement_base h))::(complete t)

base_pair: base -> pair base base
base_pair G = mkPair G C
base_pair C = mkPair C G
base_pair A = mkPair A T
base_pair T = mkPair T A

complete2: list base -> list (pair base base)
complete2 nil  = nil
complete2  l = map base_pair l

complete3: list base -> list (pair base base)
complete3 nil = nil
complete3 h::t = mkPair (h (map complement_base h::t))
--co h = 
-- Write a function called complete that takes a list base
  -- representing a strand of DNA and that returns a list (pair base
    -- base) representing a DNA molecule, such that the first strand
      -- of the DNA molecule is the giv en list of bases and the second strand is its complementary strand. You must use map to implement this function. 

change: base -> base -> Nat
change A A = 1
change T T = 1
change G G = 1
change C C = 1
change _ _ = 0

countBase: list base -> base -> Nat
countBase l b  = list.foldr plus 0 (map (change b) l)
 
