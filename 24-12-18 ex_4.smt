(declare-const a (Array Int Bool))

(define-fun adjacent ((x Int) (y Int)) Bool 
    (and 
        (<= 1 x) (<= 1 y) (<= x 16) (<= y 16) 
        (or (= y (+ x 1)) (= y (+ x 4)))
    )
)

(define-fun twice-adjacent ((x Int) (y Int) (z Int)) Bool 
    (and 
        (<= 1 x) (<= 1 y) (<= 1 z) (<= x 16) (<= y 16) (<= z 16)
        (or 
            (and (= y (+ x 1)) (= z (+ y 1))) 
            (and (= y (+ x 4)) (= z (+ y 4))))
    )
)

(define-fun PRE ((a (Array Int Bool)) (x Int)) Bool
    (and
        (forall ((i Int)) (= 
                        (= (select a i) true)               
                        (or (= i 2) (= i 4) (= i 5) (= i 6) (= i 11) (= i 13) (= i 15)))
        )      
        (= x 1)
    )
)

(define-fun POST ((x Int)) Bool (= x 16))

(define-fun TRANS ((a (Array Int Bool)) (x Int) (ap (Array Int Bool)) (xp Int) (z Int)) Bool
    (or 
        (and 
            (adjacent x xp) 
            (= (select a xp) false) 
            (= ap a))
        (and 
            (twice-adjacent x xp z) 
            (= (select a z) false) 
            (= (select a xp) true)
            (= ap (store (store a xp false) z true))
        )
    )
)
(declare-const a0 (Array Int Bool))
(declare-const x0 Int)

(declare-const a1 (Array Int Bool))
(declare-const  x1 Int)
(declare-const  Z1 Int)

(declare-const a2 (Array Int Bool))
(declare-const  x2 Int)
(declare-const  Z2 Int)

(declare-const a3 (Array Int Bool))
(declare-const  x3 Int)
(declare-const  Z3 Int)

(declare-const a4 (Array Int Bool))
(declare-const  x4 Int)
(declare-const  Z4 Int)

(declare-const a5 (Array Int Bool))
(declare-const  x5 Int)
(declare-const  Z5 Int)

(declare-const a6 (Array Int Bool))
(declare-const  x6 Int)
(declare-const  Z6 Int)

(assert (PRE a0 x0))
(assert (TRANS a0 x0 a1 x1 Z1))
(assert (TRANS a1 x1 a2 x2 Z2))
(assert (TRANS a2 x2 a3 x3 Z3))
(assert (TRANS a3 x3 a4 x4 Z4))
(assert (TRANS a4 x4 a5 x5 Z5))
(assert (TRANS a5 x5 a6 x6 Z6))
(assert (POST x6))

(echo "")
(echo "Ex 3.3")
(check-sat)
(get-value (x0 x1 x2 x3 x4 x5 x6))