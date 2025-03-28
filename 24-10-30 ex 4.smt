(define-fun xor4 ((x Bool) (y Bool) (z Bool) (w Bool)) Bool
    (and
        (or x y z w)
        ((_ at-most 1) x y z w)
    )
)

; P<pigeon number><hole number>

(declare-const P11 Bool)
(declare-const P12 Bool)
(declare-const P13 Bool)
(declare-const P14 Bool)
(declare-const P21 Bool)
(declare-const P22 Bool)
(declare-const P23 Bool)
(declare-const P24 Bool)
(declare-const P31 Bool)
(declare-const P32 Bool)
(declare-const P33 Bool)
(declare-const P34 Bool)
(declare-const P41 Bool)
(declare-const P42 Bool)
(declare-const P43 Bool)
(declare-const P44 Bool)

; a pigeon can stay in one hole only
(assert (xor4 P11 P12 P13 P14))
(assert (xor4 P21 P22 P23 P24))
(assert (xor4 P31 P32 P33 P34))
(assert (xor4 P41 P42 P43 P44))

; each hole can contain only one pigeon
(assert (xor4 P11 P21 P31 P41))
(assert (xor4 P12 P22 P32 P42))
(assert (xor4 P13 P23 P33 P43))
(assert (xor4 P14 P24 P34 P44))

(assert (not P12))
(assert (not P13))
(assert (not P23))
(assert (not P24))
(assert (not P31))
(assert (not P32))
(assert (not P43))
(assert (not P44))
; could also have used the and 
; (assert (and (not P12) (notP13)))

(check-sat)
(get-model)

; model: P14, P22, P33, P41

