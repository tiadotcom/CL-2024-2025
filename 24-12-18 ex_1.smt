(declare-datatypes () ((G a b c d e f)))
(declare-fun R (G G) Bool)
(assert (forall ((x G) (y G)) 
    (=
    (R x y)
    (or
        (and (= x a) (= y b))
        (and (= x a) (= y e))
        (and (= x a) (= y f))
        (and (= x f) (= y e))
        (and (= x f) (= y d))
        (and (= x d) (= y e))
        (and (= x d) (= y b))
        (and (= x e) (= y b))
        (and (= x b) (= y c))
        (and (= x c) (= y d))
    )
    )
))

(declare-const I G) ; Initial node
(define-fun PRE ((p G) (V (Array G Bool))) Bool    
    (and
        (= p I)
        (forall ((x G)) (not (select V x)))
    )
)
(define-fun POST ((p G) (V (Array G Bool))) Bool
    (and
        (= p I)
        (forall ((x G)) (select V x))
    )
)
(define-fun TRANSISTOR ((p G) (pp G) (V (Array G Bool)) (Vp (Array G Bool))) Bool
    (and
        (not (V pp)) ; the next point is not visited
        (or (R p pp) (R pp p)) ; p and pp are connected by an edge
        (= Vp (store V pp true))
    )
)

(declare-const p0 G)
(declare-const V0 (Array G Bool))
(declare-const p1 G)
(declare-const V1 (Array G Bool))
(declare-const p2 G)
(declare-const V2 (Array G Bool))
(declare-const p3 G)
(declare-const V3 (Array G Bool))
(declare-const p4 G)
(declare-const V4 (Array G Bool))
(declare-const p5 G)
(declare-const V5 (Array G Bool))
(declare-const p6 G)
(declare-const V6 (Array G Bool))

(assert (PRE p0 V0))
(assert (TRANSISTOR p0 p1 V0 V1))
(assert (TRANSISTOR p1 p2 V1 V2))
(assert (TRANSISTOR p2 p3 V2 V3))
(assert (TRANSISTOR p3 p4 V3 V4))
(assert (TRANSISTOR p4 p5 V4 V5))
(assert (TRANSISTOR p5 p6 V5 V6))
(assert (POST p6 V6))

(check-sat)
(get-value (p0 p1 p2 p3 p4 p5 p6))