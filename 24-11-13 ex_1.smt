; Prove that the following syllogism is correct:
; All men are mortals.
; No mortal is perfect.
; -------------------------
; Hence: no man is perfect.

(push)
(declare-sort D)
(declare-fun Man (D) Bool)
(declare-fun Mortal (D) Bool)
(declare-fun Perfect (D) Bool)

(assert (forall ((x D)) (=> (Man x) (Mortal x))))
(assert (not (exists ((x D)) (and (Mortal x) (Perfect x)))))

(assert (exists ((x D)) (and (Man x) (Perfect x)))) ; negation of the conclusion
(check-sat)
(pop)


; Prove that the following syllogism is not correct:
; All men are mortals.
; Some mortals lie.
; -------------------------
; Hence: some men lie.

(push)
(declare-sort D)
(declare-fun Man (D) Bool)
(declare-fun Mortal (D) Bool)
(declare-fun Lies (D) Bool)

(assert (forall ((x D)) (=> (Man x) (Mortal x))))
(assert (exists ((x D)) (and (Mortal x) (Lies x))))

(assert (not (exists ((x D)) (and (Man x) (Lies x))))) ; negation of the conclusion
(check-sat)
(pop)