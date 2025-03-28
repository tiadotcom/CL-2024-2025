; To check that A is a tautology, you have to NEGATE THE FORMULA (assert ¬A) and check-sat. 
; If you get unsat, the formula is a tautology; otherwise, it is not.

(declare-const p Bool)
(declare-const q Bool)

(assert (not (=> (=> (=> p q) p) p)))

(check-sat)

