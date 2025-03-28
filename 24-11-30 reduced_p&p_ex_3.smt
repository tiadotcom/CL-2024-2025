; Es 3.1
(push)
(declare-const p1 Bool)
(declare-const p2 Bool)
(declare-const p3 Bool)
(declare-const p4 Bool)
(declare-const p5 Bool)
(declare-const p6 Bool)
(declare-const p7 Bool)
(declare-const p8 Bool)

(assert (or (not p1) p2))
(assert (or (not p3) p4))
(assert p1)
(assert p5)
(assert p3)
(assert p6)
(assert (or (not p2) (not p5) (not p7)))
(assert (or (not p4) (not p8) (not p6)))

(check-sat)
(pop)

; Es 3.2
(push)
(declare-const q Bool)
(declare-const p Bool)
(declare-const s Bool)

(assert (or (not q) p))
(assert (or (not p) (not s)))
(assert s)
(assert q)

(check-sat)
(pop)

; Es 3.4
(push)
(declare-const w Bool)
(declare-const l Bool)
(declare-const b Bool)
(declare-const s Bool)

(assert (or (not w) l b))
(assert (or (not l) w))
(assert (or (not b) w))
(assert (or (not b) s))
(assert (not s))
(assert (or w l))
(assert (or (not l) (not w)))

(check-sat)
(pop)

; Es 3.4 CDCL
; (empty set | 1-7 | *)
; propagate
; (-s[5] | 1-7 | *)
; propagate
; (-s[5], -k[4] | 1-7 | *)
; decide
; (-s[5], -k[4], -l[d] | 1-7 | *)
; propagate
; (-s[5], -k[4], -l[d], w[6] | 1-7 | *)
; conflict
; (-s[5], -k[4], -l[d], w[6] | 1-7 | -w V l V k)
; explain
; (-s[5], -k[4], -l[d], w[6] | 1-7 | l V k)
; we learn a new clause 8) l V k
; backjump
; (-s[5], -k[4], l[8] | 1-8 | *)
; propagate
; (-s[5], -k[4], l[8], -w[7] | 1-8 | *)
; conflict
; ; (-s[5], -k[4], l[8], -w[7] | 1-8 | -l V w)
; since we entered conflict stage without decided literals, we can end the procedure
; failure
; unsat


