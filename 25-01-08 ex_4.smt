(declare-const l1 (List Int)) ; l1 is declared as a list of integers
(declare-const l2 (List Int))
(declare-const l3 (List Int))

(assert (= l1 (insert 3 (insert  2 (insert 1 nil))))) ; l1 = [3, 2, 1]
(assert (= l2 (insert  5 (insert 4 nil)))) ; l2 = [5, 4]
(assert (= l3 (insert 6 nil))) ; l3 = [6]

(declare-const lf (List Int))
(assert (= lf (insert 1 (insert  2 (insert 3 nil))))) ; this is the final configuration that we want to obtain: lf = [1, 2, 3]


(define-fun receiver 
; defines the condition for a list to be the receiver of a block
    ((L (List Int)))  Bool 
        (or 
            (= L nil) ; if the list is empty, it can receive a block
            ; tail L removes the head of the list (the leftmost element)
            (= (tail L) nil) ; if the list contains one element, it can receive a block
            (= (tail (tail L)) nil) ; if the list contains two elements, it can receive a block
        )
)

(define-fun exchange
; this says that L1, M1 is obtained from L, M by moving the top of L to the top of M
    ((L (List Int)) (M (List Int)) (L1 (List Int)) (M1 (List Int)))  Bool 
        (and 
            (receiver M) ; the list M must meet the receiver conditions
            (not (= L nil)) ; the list L cannot be empty (it must have at least one block)
            (= L1 (tail L)) ; L1 is L without the leftmost element (the top block)
            (= M1 (insert (head L) M)) ; M1 is obtained from M adding the head of L (the removed block) as the leftmost element
        )
)

(define-fun PRE ((L_left (List Int)) (L_middle (List Int)) (L_right (List Int))) Bool
    (and
        (= L_left l1) (= L_middle l2) (= L_right l3)
    )
)

(define-fun POST ((L_left (List Int)) (L_middle (List Int)) (L_right (List Int))) Bool
    (and
        (= L_left lf)
        (or
            (and (= (tail L_middle) nil) (= (tail (tail L_right)) nil)) ; L_middle has 1 block, L_right has 2 blocks
            (and (= (tail L_right) nil) (= (tail (tail L_middle)) nil)) ; L_right has 1 block, L_middle has 2 blocks
        )
    )
)

(define-fun TRANS ((L (List Int)) (M (List Int)) (R (List Int)) (Lp (List Int)) (Mp (List Int)) (Rp (List Int))) Bool
    (or
        (and (= Rp R) (receiver M) (exchange L M Lp Mp))
        (and (= Rp R) (receiver L) (exchange M L Mp Lp))
        (and (= Lp L) (receiver R) (exchange M R Mp Rp))
        (and (= Lp L) (receiver M) (exchange R M Rp Mp))
        (and (= Mp M) (receiver R) (exchange L R Lp Rp))
        (and (= Mp M) (receiver L) (exchange R L Rp Lp))
        (and (= Mp M) (= Lp L) (= Rp R))
    )
)

(declare-const L0 (List Int))
(declare-const M0 (List Int))
(declare-const R0 (List Int))

(declare-const L1 (List Int))
(declare-const M1 (List Int))
(declare-const R1 (List Int))

(declare-const L2 (List Int))
(declare-const M2 (List Int))
(declare-const R2 (List Int))

(declare-const L3 (List Int))
(declare-const M3 (List Int))
(declare-const R3 (List Int))

(declare-const L4 (List Int))
(declare-const M4 (List Int))
(declare-const R4 (List Int))

(declare-const L5 (List Int))
(declare-const M5 (List Int))
(declare-const R5 (List Int))

(declare-const L6 (List Int))
(declare-const M6 (List Int))
(declare-const R6 (List Int))

(declare-const L7 (List Int))
(declare-const M7 (List Int))
(declare-const R7 (List Int))

(assert (PRE L0 M0 R0))
(assert (TRANS L0 M0 R0 L1 M1 R1))
(assert (TRANS L1 M1 R1 L2 M2 R2))
(assert (TRANS L2 M2 R2 L3 M3 R3))
(assert (TRANS L3 M3 R3 L4 M4 R4))
(assert (TRANS L4 M4 R4 L5 M5 R5))
(assert (TRANS L5 M5 R5 L6 M6 R6))
(assert (TRANS L6 M6 R6 L7 M7 R7))
(assert (POST L7 M7 R7))

(check-sat)
(echo "")
(get-value (L0 M0 R0))
(echo "")
(get-value (L1 M1 R1))
(echo "")
(get-value (L2 M2 R2))
(echo "")
(get-value (L3 M3 R3))
(echo "")
(get-value (L4 M4 R4))
(echo "")
(get-value (L5 M5 R5))
(echo "")
(get-value (L6 M6 R6))
(echo "")
(get-value (L7 M7 R7))










