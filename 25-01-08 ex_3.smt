(define-fun absval ((x Int)) Int (ite (< x 0) (- x) x))

(declare-datatypes () ((N n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16)))
(declare-fun Xc (N) Int)
(declare-fun Yc (N) Int)

(assert (forall ((x N)) (and (<= 0 (Xc x)) (<= (Xc x) 3))))
(assert (forall ((x N)) (and (<= 0 (Yc x)) (<= (Yc x) 3))))
(assert (forall ((x N) (xp N)) 
    (=> 
        (and (= (Xc x) (Xc xp)) (= (Yc x) (Yc xp))) 
        (= x xp)
    ))
)

(define-fun TRANS ((n N) (V (Array N Bool)) (np N) (Vp (Array N Bool))) Bool 
    (and 
        (or 
            (and (= 1 (absval (- (Xc n) (Xc np)))) (= (Yc n) (Yc np)))
            (and (= 1 (absval (- (Yc n) (Yc np)))) (= (Xc n) (Xc np)))
        ) 
        (not (V np)) ; V = visited
        (= Vp (store V np true))
    )
)
(define-fun PRE ((n N) (V (Array N Bool))) Bool 
    (and 
        (= (Xc n) 0) 
        (= (Yc n) 0) 
        (forall ((n N)) (not (V n))))
)

(define-fun POST ((n N) (V (Array N Bool))) Bool
   (and 
        (= (Xc n) 0)
        (= (Yc n) 0)
        (forall ((n N)) (V n))
    )
)

(declare-const x0 N)
(declare-const V0 (Array N Bool))

(declare-const x1 N)
(declare-const V1 (Array N Bool))

(declare-const x2 N)
(declare-const V2 (Array N Bool))

(declare-const x3 N)
(declare-const V3 (Array N Bool))

(declare-const x4 N)
(declare-const V4 (Array N Bool))

(declare-const x5 N)
(declare-const V5 (Array N Bool))

(declare-const x6 N)
(declare-const V6 (Array N Bool))

(declare-const x7 N)
(declare-const V7 (Array N Bool))

(declare-const x8 N)
(declare-const V8 (Array N Bool))

(declare-const x9 N)
(declare-const V9 (Array N Bool))

(declare-const x10 N)
(declare-const V10 (Array N Bool))

(declare-const x11 N)
(declare-const V11 (Array N Bool))

(declare-const x12 N)
(declare-const V12 (Array N Bool))

(declare-const x13 N)
(declare-const V13 (Array N Bool))

(declare-const x14 N)
(declare-const V14 (Array N Bool))

(declare-const x15 N)
(declare-const V15 (Array N Bool))

(declare-const x16 N)
(declare-const V16 (Array N Bool))

(assert (PRE x0 V0 ) )
(assert (TRANS x0 V0 x1 V1 ) )
(assert (TRANS x1 V1 x2 V2 ) )
(assert (TRANS x2 V2 x3 V3 ) )
(assert (TRANS x3 V3 x4 V4 ) )
(assert (TRANS x4 V4 x5 V5 ) )
(assert (TRANS x5 V5 x6 V6 ) )
(assert (TRANS x6 V6 x7 V7 ) )
(assert (TRANS x7 V7 x8 V8 ) )
(assert (TRANS x8 V8 x9 V9 ) )
(assert (TRANS x9 V9 x10 V10 ) )
(assert (TRANS x10 V10 x11 V11 ) )
(assert (TRANS x11 V11 x12 V12 ) )
(assert (TRANS x12 V12 x13 V13 ) )
(assert (TRANS x13 V13 x14 V14 ) )
(assert (TRANS x14 V14 x15 V15 ) )
(assert (TRANS x15 V15 x16 V16 ) )
(assert (POST x16 V16) )

(check-sat)

(echo " ")
(eval (Xc x0))
(eval (Yc x0))
(echo " ")
(eval (Xc x1))
(eval (Yc x1))
(echo " ")
(eval (Xc x2))
(eval (Yc x2))
(echo " ")
(eval (Xc x3))
(eval (Yc x3))
(echo " ")
(eval (Xc x4))
(eval (Yc x4))
(echo " ")
(eval (Xc x5))
(eval (Yc x5))
(echo " ")
(eval (Xc x6))
(eval (Yc x6))
(echo " ")
(eval (Xc x7))
(eval (Yc x7))
(echo " ")
(eval (Xc x8))
(eval (Yc x8))
(echo " ")
(eval (Xc x9))
(eval (Yc x9))
(echo " ")
(eval (Xc x10))
(eval (Yc x10))
(echo " ")
(eval (Xc x11))
(eval (Yc x11))
(echo " ")
(eval (Xc x12))
(eval (Yc x12))
(echo " ")
(eval (Xc x13))
(eval (Yc x13))
(echo " ")
(eval (Xc x14))
(eval (Yc x14))
(echo " ")
(eval (Xc x15))
(eval (Yc x15))
(echo " ")
(eval (Xc x16))
(eval (Yc x16))

