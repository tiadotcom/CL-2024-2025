(declare-const p Bool)
(declare-const q Bool)
(declare-const r Bool)
(assert (or (not p) q r))
(assert (or p (not q) (not r)))
(assert (or (not q) r))
(assert (or q (not r)))
(assert (or (not p) (not q) (not r)))
(check-sat)
(get-model)

; clauses
; -p V q V r
; p V -q V -r
; -q V r
; q V -r
; -p V -q V -r

; solution via CDCL
; < 0 | 1-5 | * >
; decide
; < q[d] | 1-5 | * >
; propagate twice
; < q[d], r[3], -p[5] | 1-5 | * >
; conflict 
; < q[d], r[3], -p[5] | 1-5 | p V -q V -r >
; explain
; < q[d], r[3], -p[5] | 1-5 | -q V -r >
; explain
; < q[d], r[3], -p[5] | 1-6 | -q >
; backjump
; < -q[d] | 1-6 | * >
; propagate
; < -q[d], -r[4] | 1-6 | * >
; propagate
; < -q[d], -r[4], -p[1] | 1-6 | * >
; all literals are assigned
; SAT

; solution via CDCL
; < 0 | 1-5 | * >
; decide
; < p[d] | 1-5 | * >
; propagate twice
; < p[d], q[1], -r[5] | 1-5 | * >
; conflict
; < p[d], q[1], -r[5] | 1-5 | -q V r >
; explain
; < p[d], q[1], -r[5] | 1-5 | -p V -q >
; explain
; < p[d], q[1], -r[5] | 1-6 | -p V r >
; explain
; < p[d], q[1], -r[5] | 1-6 | -p V -q >
