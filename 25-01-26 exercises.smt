; Show that three colors are sufficient to color the Central America country map
(push)
(declare-datatypes () ((C b g e h n c p)))
(declare-fun Color (C) Int)
(declare-fun Border (C C) Bool)
(assert (forall ((x C) (y C)) (=> (Border x y) (not (= (Color x) (Color y))))))
(assert (and (Border b g) (Border g e) (Border g h) (Border e h) (Border h n) (Border n c) (Border c p)))
(assert (forall ((x C)) (and (<= 1 (Color x)) (<= (Color x) 3))))
(check-sat)
(get-model)
(pop)

; Group of friends
(push)
(define-fun xor3 ((x Bool) (y Bool) (z Bool)) Bool 
                (and 
                         (or x y z) 
                         ((_ at-most 1) x y z)
                 )
)
(declare-const a1 Bool)
(declare-const a2 Bool)
(declare-const a3 Bool)
(declare-const b1 Bool)
(declare-const b2 Bool)
(declare-const b3 Bool)
(declare-const c1 Bool)
(declare-const c2 Bool)
(declare-const c3 Bool)
(declare-const d1 Bool)
(declare-const d2 Bool)
(declare-const d3 Bool)
(declare-const e1 Bool)
(declare-const e2 Bool)
(declare-const e3 Bool)
(assert (xor3 a1 a2 a3))
(assert (xor3 b1 b2 b3))
(assert (xor3 c1 c2 c3))
(assert (xor3 d1 d2 d3))
(assert (xor3 e1 e2 e3))
(assert ((_ at-most 2) a1 b1 c1 d1 e1))
(assert ((_ at-most 2) a2 b2 c2 d2 e2))
(assert ((_ at-most 2) a3 b3 c3 d3 e3))
(assert (or (and a1 b1) (and a2 b2) (and a3 b3) (and a1 e1) (and a2 e2) (and a3 e3)))
(assert (or (and a1 b1) (and a2 b2) (and a3 b3) (and b1 c1) (and b2 c2) (and b3 c3)))
(assert (or (and c1 b1) (and c2 b2) (and c3 b3) (and c1 d1) (and c2 d2) (and c3 d3)))
(assert (or (and d1 c1) (and d2 c2) (and d3 c3) (and d1 e1) (and d2 e2) (and d3 e3)))
(assert (or (and e1 d1) (and e2 d2) (and e3 d3) (and e1 a1) (and e2 a2) (and e3 a3)))
(check-sat)
(pop)

; A shepherd must ferry a wolf, a sheep, and a cabbage from one side of a river to the other.
; He may ferry a maximum of one of the three passengers at a time. 
; He must not leave wolf and sheep, nor sheep and cabbage together without his supervision. How should he do this? 
; What is the minimum number of crossings he needs?
(push)
(declare-sort D)
(declare-fun SIDE (D) Int)

(define-fun INITIAL ((w D) (s D) (c D) (p D)) Bool
    (and
        (= (SIDE w) 0) (= (SIDE s) 0) (= (SIDE c) 0) (= (SIDE p) 0)
    )
)

(define-fun FINAL ((w D) (s D) (c D) (p D)) Bool
    (and
        (= (SIDE w) 1) (= (SIDE s) 1) (= (SIDE c) 1) (= (SIDE p) 1)
    )
)

(assert (forall ((x D)) (xor (= (SIDE x) 0) (= (SIDE x) 1))))
(assert (forall ((x D)) (= (= (SIDE x) 0) (not (= (SIDE x) 1)))))

(define-fun abs ((x Int)) Int (ite (< x 0) (- 0 x) x))

(define-fun TRANS ((w D) (s D) (c D) (p D) (wp D) (sp D) (cp D) (pp D)) Bool
    (and
        (=> (= (SIDE wp) (SIDE sp) 0) (= (SIDE pp) 0))
        (=> (= (SIDE wp) (SIDE sp) 1) (= (SIDE pp) 1))
        (=> (= (SIDE sp) (SIDE cp) 0) (= (SIDE pp) 0))
        (=> (= (SIDE sp) (SIDE cp) 1) (= (SIDE pp) 1))
        (or 
            (and (= (SIDE wp) (SIDE w)) (= (SIDE sp) (SIDE s)) (= (SIDE cp) (SIDE c)) (= (SIDE pp) (abs (- (SIDE p) 1))))
            (and (= (SIDE wp) (abs (- (SIDE w) 1))) (= (SIDE sp) (SIDE s)) (= (SIDE cp) (SIDE c)) (= (SIDE pp) (abs (- (SIDE p) 1))))
            (and (= (SIDE wp) (SIDE w)) (= (SIDE sp) (abs (- (SIDE s) 1))) (= (SIDE cp) (SIDE c)) (= (SIDE pp) (abs (- (SIDE p) 1))))
            (and (= (SIDE wp) (SIDE w)) (= (SIDE sp) (SIDE s)) (= (SIDE cp) (abs (- (SIDE c) 1))) (= (SIDE pp) (abs (- (SIDE p) 1))))
        )
    )
)
(declare-const w0 D)
(declare-const s0 D)
(declare-const c0 D)
(declare-const p0 D)

(declare-const w1 D)
(declare-const s1 D)
(declare-const c1 D)
(declare-const p1 D)

(declare-const w2 D)
(declare-const s2 D)
(declare-const c2 D)
(declare-const p2 D)

(declare-const w3 D)
(declare-const s3 D)
(declare-const c3 D)
(declare-const p3 D)

(declare-const w4 D)
(declare-const s4 D)
(declare-const c4 D)
(declare-const p4 D)

(declare-const w5 D)
(declare-const s5 D)
(declare-const c5 D)
(declare-const p5 D)

(declare-const w6 D)
(declare-const s6 D)
(declare-const c6 D)
(declare-const p6 D)

(declare-const w7 D)
(declare-const s7 D)
(declare-const c7 D)
(declare-const p7 D)

(assert (INITIAL w0 s0 c0 p0))
(assert (TRANS w0 s0 c0 p0 w1 s1 c1 p1))
(assert (TRANS w1 s1 c1 p1 w2 s2 c2 p2))
(assert (TRANS w2 s2 c2 p2 w3 s3 c3 p3))
(assert (TRANS w3 s3 c3 p3 w4 s4 c4 p4))
(assert (TRANS w4 s4 c4 p4 w5 s5 c5 p5))
(assert (TRANS w5 s5 c5 p5 w6 s6 c6 p6))
(assert (TRANS w6 s6 c6 p6 w7 s7 c7 p7))
(assert (FINAL w7 s7 c7 p7))
(check-sat)
(get-value ((SIDE w0) (SIDE s0) (SIDE c0) (SIDE p0)))
(get-value ((SIDE w1) (SIDE s1) (SIDE c1) (SIDE p1)))
(get-value ((SIDE w2) (SIDE s2) (SIDE c2) (SIDE p2)))
(get-value ((SIDE w3) (SIDE s3) (SIDE c3) (SIDE p3)))
(get-value ((SIDE w4) (SIDE s4) (SIDE c4) (SIDE p4)))
(get-value ((SIDE w5) (SIDE s5) (SIDE c5) (SIDE p5)))
(get-value ((SIDE w6) (SIDE s6) (SIDE c6) (SIDE p6)))
(get-value ((SIDE w7) (SIDE s7) (SIDE c7) (SIDE p7)))
(pop)

; Hamiltonian cycle
(push)
(declare-datatypes () ((N n1 n2 n3 n4 n5 n6)))
(declare-const i N)
(declare-fun EDGE (N N) Bool)

; (assert (and (EDGE n1 n2) (EDGE n1 n4) (EDGE n1 n3) 
;              (EDGE n2 n5) (EDGE n3 n5) (EDGE n3 n4)
;              (EDGE n4 n5) (EDGE n2 n3) (EDGE n5 n6) (EDGE n4 n6))
; )

(assert (forall ((x N) (y N)) 
    (=
    (EDGE x y)
    (or
        (and (= x n1) (= y n2))
        (and (= x n1) (= y n5))
        (and (= x n1) (= y n6))
        (and (= x n6) (= y n5))
        (and (= x n6) (= y n4))
        (and (= x n4) (= y n5))
        (and (= x n4) (= y n2))
        (and (= x n5) (= y n2))
        (and (= x n2) (= y n3))
        (and (= x n3) (= y n4))
    )
    )
))

; (assert (forall ((x N) (y N)) (=> (EDGE x y) (EDGE y x))))

(define-fun PRE ((n N) (vis (Array N Bool))) Bool
    (and 
        (forall ((n N)) (= (select vis n) false))
        (= n i)
    )
)

(define-fun POST ((n N) (vis (Array N Bool))) Bool
    (and 
        (forall ((n N)) (= (select vis n) true))
        (= n i)
    )
)

(define-fun TRANS ((n N) (np N) (vis (Array N Bool)) (visp (Array N Bool))) Bool
    (and
        (or (EDGE n np) (EDGE np n))
        (= (select vis np) false)
        (= visp (store vis np true))
    )
)   

(declare-const p0 N)
(declare-const vis0 (Array N Bool))
(declare-const p1 N)
(declare-const vis1 (Array N Bool))
(declare-const p2 N)
(declare-const vis2 (Array N Bool))
(declare-const p3 N)
(declare-const vis3 (Array N Bool))
(declare-const p4 N)
(declare-const vis4 (Array N Bool))
(declare-const p5 N)
(declare-const vis5 (Array N Bool))
(declare-const p6 N)
(declare-const vis6 (Array N Bool))

(assert (PRE p0 vis0))
(assert (TRANS p0 p1 vis0 vis1))
(assert (TRANS p1 p2 vis1 vis2))
(assert (TRANS p2 p3 vis2 vis3))
(assert (TRANS p3 p4 vis3 vis4))
(assert (TRANS p4 p5 vis4 vis5))
(assert (TRANS p5 p6 vis5 vis6))
(assert (POST p6 vis6))

(check-sat)
(get-value (p0 p1 p2 p3 p4 p5 p6))
(pop)


; Hamiltonian path
(push)
(declare-datatypes () ((N n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11)))
(declare-fun EDGE (N N) Bool)
(assert (forall ((x N) (y N)) 
    (=
        (EDGE x y)  
        (or
            (and (= x n1) (= y n2))
            (and (= x n1) (= y n5))
            (and (= x n1) (= y n4))
            (and (= x n2) (= y n11))
            (and (= x n2) (= y n10))
            (and (= x n2) (= y n3))
            (and (= x n3) (= y n9))
            (and (= x n3) (= y n4))
            (and (= x n4) (= y n8))
            (and (= x n4) (= y n6))
            (and (= x n5) (= y n6))
            (and (= x n6) (= y n7))
            (and (= x n11) (= y n7))
            (and (= x n11) (= y n5))
            (and (= x n7) (= y n10))
            (and (= x n7) (= y n8))
            (and (= x n9) (= y n8))
            (and (= x n9) (= y n10))
        )
    )
))

(define-fun PRE ((p N) (v (Array N Bool))) Bool
     (and 
          (= (select v p) true) 
          (forall ((x N)) (=> (not (= x p)) (= (select v x) false)))
     )
)

(define-fun POST ((v (Array N Bool))) Bool
    (forall ((n N)) (= (select v n) true))
)

(define-fun TRANS ((p N) (pp N) (v (Array N Bool)) (vp (Array N Bool))) Bool
    (and
        (or (EDGE p pp) (EDGE pp p)) 
        (= (select v pp) false)
        (= vp (store v pp true))
    )
)

(declare-const p0 N)
(declare-const v0 (Array N Bool))
(declare-const p1 N)
(declare-const v1 (Array N Bool))
(declare-const p2 N)
(declare-const v2 (Array N Bool))
(declare-const p3 N)
(declare-const v3 (Array N Bool))
(declare-const p4 N)
(declare-const v4 (Array N Bool))
(declare-const p5 N)
(declare-const v5 (Array N Bool))
(declare-const p6 N)
(declare-const v6 (Array N Bool))
(declare-const p7 N)
(declare-const v7 (Array N Bool))
(declare-const p8 N)
(declare-const v8 (Array N Bool))
(declare-const p9 N)
(declare-const v9 (Array N Bool))
(declare-const p10 N)
(declare-const v10 (Array N Bool))
(declare-const p11 N)
(declare-const v11 (Array N Bool))

(assert (PRE p0 v0))
(assert (TRANS p0 p1 v0 v1))
(assert (TRANS p1 p2 v1 v2))
(assert (TRANS p2 p3 v2 v3))
(assert (TRANS p3 p4 v3 v4))
(assert (TRANS p4 p5 v4 v5))
(assert (TRANS p5 p6 v5 v6))
(assert (TRANS p6 p7 v6 v7))
(assert (TRANS p7 p8 v7 v8))
(assert (TRANS p8 p9 v8 v9))
(assert (TRANS p9 p10 v9 v10))
(assert (POST v10))
(check-sat)
(get-value (p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10))
(pop)
