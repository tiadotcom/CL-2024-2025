; p2 ∨ p3,
; ¬p1 ∨ p2,
; ¬p4 ∨ ¬p2,
; ¬p1 ∨ p4,
; ¬p4 ∨ p2,
; p1 ∨ ¬p3

(declare-const p1 Bool)
(declare-const p2 Bool)
(declare-const p3 Bool)
(declare-const p4 Bool)

(assert (or p2 p3))
(assert (or (not p1) p2))
(assert (or (not p4) (not p2)))
(assert (or (not p1) p4))
(assert (or (not p4) p2))
(assert (or p1 (not p3)))

(check-sat)
