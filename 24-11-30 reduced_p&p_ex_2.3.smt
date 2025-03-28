; p4 ∨ p2
; ¬p1 ∨ p2
; p1 ∨ p4
; ¬p4 ∨ ¬p2
; ¬p1 ∨ p4
; p1 ∨ ¬p3 ∨ ¬p4
; p1 ∨ p3 ∨ ¬p4

(declare-const p1 Bool)
(declare-const p2 Bool)
(declare-const p3 Bool)
(declare-const p4 Bool)

(assert (or p4 p2))
(assert (or (not p1) p2))
(assert (or p1 p4))
(assert (or (not p4) (not p2)))
(assert (or (not p1) p4))
(assert (or p1 (not p3) (not p4)))
(assert (or p1 p3 (not p4)))

(check-sat)

; CDCL
; (empty set | 1-7 | *)
; decide
; (p4[d] | 1-7 | *)
; propagate
; (p4[d], -p2[2] | 1-7 | *)
; propagate
; (p4[d], -p2[2], -p1[4] | 1-7 | *)
; propagate
; (p4[d], -p2[2], -p1[4], p4[7] | 1-7 | *)
; backjump
; (p4[7] | 1-7 | *)
; propagate
; (p4[7], -p2[2] | 1-7 | *)
; propagate
; (p4[7], -p2[2], -p1[4] | 1-7 | *)
; propagate
; (p4[7], -p2[2], -p1[4], p3[6] | 1-7 | *)
; conflict
; (p4[7], -p2[2], -p1[4], p3[6] | 1-7 | p1 ∨ -p3 ∨ -p4)
; we ended up in conflict state without decided literals
; failure 
; unsat