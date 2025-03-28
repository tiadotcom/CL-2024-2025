; Prove that we can always choose 3 different persons who are either familiar with each other or not familiar with each other, from 6 persons we meet at a party.

(declare-datatypes () ((D a b c d e f)))
(declare-fun IsFamiliar (D D) Bool)
(assert (forall ((x D) (y D)) (= (IsFamiliar x y) (IsFamiliar y x))))

; Imagine a situation in which:
;   - there aren't 3 mutually familiar persons
;   - there aren't 3 mutually unfamiliar persons
; Prove that this situation is unsat

(assert (not (exists ((x D) (y D) (z D)) (and (IsFamiliar x y) (IsFamiliar x z) (IsFamiliar y z)))))
(assert (not (exists ((x D) (y D) (z D)) (and (not (IsFamiliar x y)) (not (IsFamiliar x z)) (not (IsFamiliar y z))))))
(check-sat)

