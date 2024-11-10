; Check whether the following inference is correct or not:

; Mary goes to the party if Lucia goes.
; If it rains, Lucia does not go to the party.
; --------------------------------------------
; If it does not rain, Mary goes to the party.

(declare-const M Bool) ; M = Mary goes to the party
(declare-const L Bool) ; L = Lucia goes to the party
(declare-const R Bool) ; R = it rains

(assert (=> L M)) 
(assert (=> R (not L)))

; I negate the consequence 
(assert (not (=> (not R) M))) 

(check-sat) ; If I get unsat, then the inference is correct







