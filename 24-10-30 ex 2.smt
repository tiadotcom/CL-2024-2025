(declare-const g Bool)
(declare-const s Bool)
(declare-const l Bool)

(define-fun xor3 ((x Bool) (y Bool) (z Bool)) Bool
	(and
		(or x y z)
		((_ at-most 1) x y z)
	)
)

(assert (xor3 s g l))
(assert ((_ at-most 1) g (not s) (not g)))

(check-sat)
(get-model)

