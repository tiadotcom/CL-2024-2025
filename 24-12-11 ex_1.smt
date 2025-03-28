; Start with a bag with 10 white balls and 9 black balls. Take out two balls: 
;   - if they have the same color, put a black ball into the bag; 
;   - if they have a different color, put a white ball back into the bag. 
; Show that last ball left cannot be white.

(define-fun INITIAL ((w Int) (b Int)) Bool (and (= w 10) (= b 9))) ; Initial state
(define-fun FINAL ((w Int) (b Int)) Bool (and (= 1 w) (= 0 b))) ; at the end we have 1 white ball and 0 black balls
; We want to show that it is not possible to reach this FINAL position 

(define-fun TRANSISTOR ((w Int) (b Int) (wp Int) (bp Int)) Bool
    (and 
                (<= 0 w) 
                (<= 0 b) 
                (or 
                    (and (and (= wp (- w 1)) (= bp (- b 1))) (= wp (+ w 1))) ; if they have a different color, put a white ball back into the bag
                    (and (and (= wp w) (= bp (- b 2))) (= bp (+ b 1))) ; if they have the same color, put a black ball into the bag
                    (and (and (= bp w) (= wp (- w 2))) (= bp (+ b 1))); if they have the same color, put a black ball into the bag
                    (and (= wp w) (= bp b)) 
                )
    )  
)

(declare-const w0 Int)
(declare-const p0 Int)
(declare-const w1 Int)
(declare-const p1 Int)
(declare-const w2 Int)
(declare-const p2 Int)
(declare-const w3 Int)
(declare-const p3 Int)
(declare-const w4 Int)
(declare-const p4 Int)
(declare-const w5 Int)
(declare-const p5 Int)
(declare-const w6 Int)
(declare-const p6 Int)
(declare-const w7 Int)
(declare-const p7 Int)
(declare-const w8 Int)
(declare-const p8 Int)
(declare-const w9 Int)
(declare-const p9 Int)
(declare-const w10 Int)
(declare-const p10 Int)
(declare-const w11 Int)
(declare-const p11 Int)
(declare-const w12 Int)
(declare-const p12 Int)
(declare-const w13 Int)
(declare-const p13 Int)
(declare-const w14 Int)
(declare-const p14 Int)
(declare-const w15 Int)
(declare-const p15 Int)
(declare-const w16 Int)
(declare-const p16 Int)
(declare-const w17 Int)
(declare-const p17 Int)
(declare-const w18 Int)
(declare-const p18 Int)

(assert (INITIAL w0 p0)) 
(assert (TRANSISTOR w0 p0 w1 p1))
(assert (TRANSISTOR w1 p1 w2 p2))
(assert (TRANSISTOR w2 p2 w3 p3))
(assert (TRANSISTOR w3 p3 w4 p4))
(assert (TRANSISTOR w4 p4 w5 p5))
(assert (TRANSISTOR w5 p5 w6 p6))
(assert (TRANSISTOR w6 p6 w7 p7))
(assert (TRANSISTOR w7 p7 w8 p8))
(assert (TRANSISTOR w8 p8 w9 p9))
(assert (TRANSISTOR w9 p9 w10 p10))
(assert (TRANSISTOR w10 p10 w11 p11))
(assert (TRANSISTOR w11 p11 w12 p12))
(assert (TRANSISTOR w12 p12 w13 p13))
(assert (TRANSISTOR w13 p13 w14 p14))
(assert (TRANSISTOR w14 p14 w15 p15))
(assert (TRANSISTOR w15 p15 w16 p16))
(assert (TRANSISTOR w16 p16 w17 p17))
(assert (TRANSISTOR w17 p17 w18 p18))
(assert (FINAL w18 p18))

(check-sat)
(eval w18)
(eval p18)



