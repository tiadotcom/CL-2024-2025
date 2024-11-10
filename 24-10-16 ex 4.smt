; To check whether an inference is correct or not you write the premises and the NEGATE THE CONCLUSION.
; If you get unsat, the conclusion is correct. If you get sat, the inference is not correct.

; Peter is attending either the English or the Spanish class.
; If Peter attends the Spanish class, then he meets Joan.
; Peter is not meeting Joan.
; hence
; Peter is attending the English class.

(declare-const E Bool) ; English class
(declare-const S Bool) ; Spanish class
(declare-const J Bool) ; Joan

(assert (and (or E S) (not (and E S)))) ; Peter is attending either the English or the Spanish class
(assert (=> S J)) ; if Peter attends the Spanish class, then he meets Joan
(assert (not J)) ; Peter is not meeting Joan

(assert (not E)) ; negation of the conclusion

(check-sat)


