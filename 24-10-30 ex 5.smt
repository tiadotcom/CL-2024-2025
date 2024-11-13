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

;;student x desiderata
(assert (not (and c9 h9)))
(assert (not (and c9 a9)))
(assert (not (and h9 a9)))
(assert (not (and c10 h10)))
(assert (not (and c10 a10)))
(assert (not (and h10 a10)))
(assert (not (and c11 h11)))
(assert (not (and c11 a11)))
(assert (not (and h11 a11)))

;student y desiderata
(assert (not (and l9 p9)))
(assert (not (and l10 p10)))
(assert (not (and l11 p11)))

;student z desiderata
(assert (not c9))
(assert (not h9))
(assert (not (and c10 h10)))
(assert (not (and c11 h11)))

(check-sat)
(get-model)
