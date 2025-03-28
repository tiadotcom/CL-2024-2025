; We have to execute 8 tasks on a single machine; the tasks are named t0, t1, t2, t3, t4, t5, t6, t7. 
; We must respect the following constraints:
;   1) t0 must be executed before t6
;   2) t1 must be executed before t2, t4, t6
;   3) t3 must be executed before t0, t4
;   4) t5 must be executed before t1 
;   5) t7 must be executed before t0, t1. 
; Find an execution ordering that fulfills the above desiderata. 

(declare-datatypes () ((Tasks t0 t1 t2 t3 t4 t5 t6 t7)))
(declare-fun Position (Tasks) Int) ; range [0, 7]

(assert (forall ((x Tasks)) (and (<= 0 (Position x)) (<= (Position x) 7))))
(assert (forall ((x Tasks) (y Tasks)) (= (not (= x y)) (not (= (Position x) (Position y)))))) ; the function is injective

; 1)
(assert (< (Position t0) (Position t6)))

; 2)
(assert (and (< (Position t1) (Position t2)) (< (Position t1) (Position t4)) (< (Position t1) (Position t6))))

; 3)
(assert (and (< (Position t3) (Position t0)) (< (Position t3) (Position t4))))

; 4)
(assert (< (Position t5) (Position t1)))

; 5)
(assert (and (< (Position t7) (Position t0)) (< (Position t7) (Position t1))))

(check-sat)
(get-value ((Position t1) (Position t2) (Position t3) (Position t4) (Position t5) (Position t6) (Position t7)))
