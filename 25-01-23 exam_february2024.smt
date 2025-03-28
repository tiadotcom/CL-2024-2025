; We are given an array of five integers, call it a. 
; At each move, we can swap two entries a[i], a[i + 1] in case we have (for i ∈ {0, 1, 2, 3}) that a[i] is odd and a[i + 1] is even.
; What is the maximum number of swaps after which the array turns out to be arranged in such a way that even entries are
; located before odd entries (and consequently no further move is possible)?
; [Hint: use a bounded model checking technique (increase the bound until you get an UNSAT answer). ]

(push)

(define-fun SWAP ((A (Array Int Int)) (I Int) (J Int)) (Array Int Int)
    (store (store A J (select A I)) I (select A J))
)

(define-fun EVEN  ((N Int)) Bool (= 0 (mod N 2))) 
(define-fun ODD   ((N Int)) Bool (not (EVEN N)))

; When TRANS is executed, we swap entries I and I+1, 
; The I-th entry of A must be odd and the (I+1)-th entry of A must be even
(define-fun TRANS ((I Int)  (A (Array Int Int)) (Ip Int) (Ap (Array Int Int))) Bool
    (and 
        (< I 4) 
        (<= 0 I)
        (ODD (select A I))
        (EVEN (select A (+ I 1))) 
        (= Ap (SWAP A I (+ I 1)))      
    )
)
; We do not need an initial condition (the initial array A can be arbitrary)

(declare-const I0 Int)
(declare-const A0 (Array Int Int))
(declare-const I1 Int)
(declare-const A1 (Array Int Int))
(declare-const I2 Int)
(declare-const A2 (Array Int Int))
(declare-const I3 Int)
(declare-const A3 (Array Int Int))
(declare-const I4 Int)
(declare-const A4 (Array Int Int))
(declare-const I5 Int)
(declare-const A5 (Array Int Int))
(declare-const I6 Int)
(declare-const A6 (Array Int Int))
(declare-const I7 Int)
(declare-const A7 (Array Int Int))

(assert (TRANS I0 A0   I1 A1 ) )
(assert (TRANS I1 A1   I2 A2 ) )
(assert (TRANS I2 A2   I3 A3 ) )
(assert (TRANS I3 A3   I4 A4 ) )
(assert (TRANS I4 A4   I5 A5 ) )
(assert (TRANS I5 A5   I6 A6 ) )

(check-sat)
(echo "6 moves are  possible, as witnessed by the following initial configuration")
(get-value ((select A0 0) (select A0 1) (select A0 2) (select A0 3) (select A0 4)))
(echo "7 moves are not possible")
(assert (TRANS I5 A6   I7 A7 ) )
(check-sat)

(pop)


(push)
; (declare-const a (Array Int Int)) 
; (assert (and (= (select a 0) 9) (= (select a 1) 5) (= (select a 2) 2) (= (select a 3) 11) (= (select a 4) 4)))
(define-fun E ((num Int)) Bool (= 0 (mod num 2)))

(define-fun PRE ((a (Array Int Int))) Bool
    (and (= (select a 0) 9) (= (select a 1) 5) (= (select a 2) 2) (= (select a 3) 11) (= (select a 4) 4))
)

(define-fun POST ((a (Array Int Int))) Bool
    (or
        (not (or (E (select a 0)) (E (select a 1)) (E (select a 2)) (E (select a 3)) (E (select a 4))))         ; O O O O O
        (and (E (select a 0)) (not (or (E (select a 1)) (E (select a 2)) (E (select a 3)) (E (select a 4)))))   ; E O O O O
        (and (E (select a 0)) (E (select a 1)) (not (or (E (select a 2)) (E (select a 3)) (E (select a 4)))))   ; E E O O O
        (and (E (select a 0)) (E (select a 1)) (E (select a 2)) (not (or (E (select a 3)) (E (select a 4)))))   ; E E E O O
        (and (E (select a 0)) (E (select a 1)) (E (select a 2)) (E (select a 3)) (not (E (select a 4))))        ; E E E E O
        (and (E (select a 0)) (E (select a 1)) (E (select a 2)) (E (select a 3)) (E (select a 4)))              ; E E E E E
    )
)

(define-fun TRANS ((a (Array Int Int)) (ap (Array Int Int))) Bool
    (and
        ; (= ap (store (store a i (select a (+ i 1))) (+ i 1) (select a i)))
        (ite 
            (and (E (select a 0)) (not (E (select a 1)))) 
                (= ap (store (store a 0 (select a 1)) 1 (select a 0))) 
                    (= ap a)
        )
        (ite
            (and (E (select a 1)) (not (E (select a 2))))
                (= ap (store (store a 1 (select a 2)) 2 (select a 1)))
                    (= ap a)
        )
        (ite
            (and (E (select a 2)) (not (E (select a 3))))
                (= ap (store (store a 2 (select a 3)) 3 (select a 2)))
                    (= ap a)
        )
        (ite
            (and (E (select a 3)) (not (E (select a 4))))
                (= ap (store (store a 3 (select a 4)) 4 (select a 3)))
                    (= ap a)
        )
    )
)

(declare-const a0 (Array Int Int))
(declare-const a1 (Array Int Int))
(declare-const a2 (Array Int Int))
(declare-const a3 (Array Int Int))
(declare-const a4 (Array Int Int))
(declare-const a5 (Array Int Int))

(assert (PRE a0))
(assert (TRANS a0 a1))
(assert (TRANS a1 a2))
(assert (TRANS a2 a3))
(assert (TRANS a3 a4))
(assert (TRANS a4 a5))
(assert (POST a5))
(check-sat)
(pop)

(push)
; We are given an array of four integers, call it a. 
; At each move, we can swap two entries a[i], a[i + 1] in case we have (for i ∈ {0, 1, 2}) that a[i] > a[i+ 1]. 
; What is the maximum number of swaps after which the array turns out to be ordered in an incresing way 
; (and consequently no further move is possible)?

(define-fun SWAP ((a (Array Int Int)) (index1 Int) (index2 Int)) (Array Int Int)
    (store (store a index1 (select a index2)) index2 (select a index1))
)

(define-fun BIGGER ((n1 Int) (n2 Int)) Bool
    (> n1 n2)
)

(define-fun TRANS ((a (Array Int Int)) (i Int) (ap (Array Int Int)) (ip Int)) Bool
    (and
        (<= 0 1)
        (<= i 3)
        (BIGGER (select a i) (select a (+ i 1)))
        (= ap (SWAP a i (+ i 1)))
    )
)

(declare-const a0 (Array Int Int))
(declare-const i0 Int)
(declare-const a1 (Array Int Int))
(declare-const i1 Int)
(declare-const a2 (Array Int Int))
(declare-const i2 Int)
(declare-const a3 (Array Int Int))
(declare-const i3 Int)
(declare-const a4 (Array Int Int))
(declare-const i4 Int)
(declare-const a5 (Array Int Int))
(declare-const i5 Int)
(declare-const a6 (Array Int Int))
(declare-const i6 Int)
(declare-const a7 (Array Int Int))
(declare-const i7 Int)
(assert (TRANS a0 i0 a1 i1))
(assert (TRANS a1 i1 a2 i2))
(assert (TRANS a2 i2 a3 i3))
(assert (TRANS a3 i3 a4 i4))
(assert (TRANS a4 i4 a5 i5))
(assert (TRANS a5 i5 a6 i6))
(assert (TRANS a6 i6 a7 i7))
(check-sat)

(pop)


