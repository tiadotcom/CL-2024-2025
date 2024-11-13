(declare-sort D) ; declares the set of humans 
(declare-const s D) ; declares constant s for Socrates
(declare-fun Man (D) Bool) ; declares function Man(x)
(declare-fun Mortal (D) Bool) ; declares function Mortal(x)

(assert (forall ((x D)) (=> (Man x) (Mortal x)))) ; asserts that every man is mortal
(assert (Man s)) ; assert that Socrates is a man

(assert (not (Mortal s))) ; Socrates is not a man (we negate the conclusion in order to get unsat)

(check-sat) 