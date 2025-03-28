; Exam - July 22 2024 - Ex 2.2

(push)
(declare-sort D)
(declare-fun E (D) Bool)
(declare-fun B (D) Bool)
(declare-fun A (D) Bool)

(assert (forall ((x D)) (=> (E x) (B x))))
(assert (exists ((x D)) (and (A x) (E x))))
; (assert (not (exists ((x D)) (and (A x) (B x)))))
(assert (forall ((x D)) (or (not (A x)) (not (B x)))))
(check-sat)
(pop)

; --------------------------------------------------------------------------------------------------------

; Exam - July 22 2024 - Ex 2.1

(push)
(declare-const p1 Bool)
(declare-const p2 Bool)
(declare-const p3 Bool)
(declare-const p4 Bool)
(assert (or (not p1) p3 p4))
(assert (or p1 (not p2) (not p4)))
(assert (or p1 p2))
(assert (or p1 p3))
(assert (or (not p1) (not p4)))
(assert p1)
(assert (not p4))
(assert p3)
(assert p2)
(check-sat)
(pop)

; --------------------------------------------------------------------------------------------------------