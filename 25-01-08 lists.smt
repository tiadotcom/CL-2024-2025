(declare-const l1 (List Int))
(declare-const l2 (List Int))
(declare-const l3 (List Int))

(assert (= l1 (insert 3 (insert  2 (insert 1 nil))))) ; l1 is the list obtaining by taking the empty list (nil) and insterting 1, then 2, then 3
(assert (= l2 (insert  5 (insert 4 nil)))) ; l2 is the list obtaining by taking the empty list (nil) and insterting 4 and 5
(assert (= l3 (insert 6 nil))) ; l3 is the list obtaining by taking the empty list (nil) and insterting 6

(declare-const lf (List Int))
(assert (= lf (insert 1 (insert  2 (insert 3 nil))))) ; this is the final configuration that we want to obtain


(define-fun receiver 
; this says that L has at most 2 elements
    ((L (List Int)))  Bool 
        (or 
            (= L nil) 
            (= (tail L) nil) 
            (= (tail (tail L)) nil) 
        )
)


(define-fun exchange
; this says that L1, M1 is obtained from L, M by moving the top of L to the top of M
    ((L (List Int)) (M (List Int)) (L1 (List Int)) (M1 (List Int)))  Bool 
        (and 
            (receiver M)
            (= L1 (tail L))
            (= M1 (insert (head L) M))
            (not (= L nil))
        )
)

;Now write the TRANS function, etc.