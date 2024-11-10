(declare-const c9 Bool)
(declare-const c10 Bool)
(declare-const c11 Bool)
(declare-const l9 Bool)
(declare-const l10 Bool)
(declare-const l11 Bool)
(declare-const p9 Bool)
(declare-const p10 Bool)
(declare-const p11 Bool)
(declare-const a9 Bool)
(declare-const a10 Bool)
(declare-const a11 Bool)
(declare-const h9 Bool)
(declare-const h10 Bool)
(declare-const h11 Bool)

(define-fun xor3 ((x Bool) (y Bool) (z Bool)) Bool
    (and
        (or x y z)
        ((_ at-most 1) x y z)
    )
)

(assert (xor3 c9 c10 c11))
(assert (xor3 a9 a10 a11))
(assert (xor3 h9 h10 h11))
(assert (xor3 p9 p10 p11))
(assert (xor3 l9 l10 l11))

(assert (xor3 c9 h9 a9))
(assert (xor3 c10 h10 a10))
(assert (xor3 c11 h11 a11))

(assert ((_ at-most 2) 
        (xor l9 p9 ) 
        (xor l10 p10) 
        (xor l11 p11)
))

(assert (xor c10 h10))
(assert (xor c11 h11))
; (assert (not c9))
; (assert (not h9))

(check-sat)
(get-model)

; model: