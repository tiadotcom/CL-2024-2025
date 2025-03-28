(declare-datatypes () ((C   c1    c2   c3   c4 
                            c5    c6   c7   c8 
                            c9   c10  c11  c12 
                            c13  c14  c15  c16 
)))

(declare-fun Xc () Int)
(declare-fun Yc (C) Int)
(define-fun abs ((x Int)) Int (ite (< x 0) (- 0 x) x))

(declare-fun INITIAL ((c Int) (v (Array C Bool))) Bool
    (and
        (<= 0 (Xc c)) (<= 0 (Yc c)) (<= (Xc c) 3) (<= (Yc c) 3)
        (forall ((i C)) (= (select v i) false)) 
    )
)

(declare-fun FINAL ((c Int) (v (Array C Bool))) Bool
    (and
        (<= 0 (Xc c)) (<= 0 (Yc c)) (<= (Xc c) 3) (<= (Yc c) 3)
        (forall ((i C)) (= (select v i) true)) 
    )
)

(define-fun TRANS ((c Int) (cp Int) (v (Array Int Bool)) (vp (Array Int Bool))) Bool
    (and
        (<= 0 (Xc c)) (<= 0 (Yc c)) (<= (Xc c) 3) (<= (Yc c) 3)
        (or
            (and (= (Xc cp) (Xc c)) (= (abs (- (Yc cp) (Yc c))) 1))
            (and (= (Yc cp) (Yc c)) (= (abs (- (Xc cp) (Xc c))) 1))
        )
        (forall ((i C)) (=> (and (= (Xc i) (Xc cp)) (= (Yc i) (Yc cp))) (and (= (select v i) true) (= vp v))))
    )
)
