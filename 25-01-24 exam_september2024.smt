; Start with a bag with 10 white balls and 9 black balls. Take out two balls:
; if they have the same color, put a black ball into the bag
; if they have a different color, put a white ball back into the bag.
; Show that last ball left cannot be white.
; [Hint: use a transition system with two integer variables counting the current number of black and white balls in the bag.]

(define-fun PRE ((b Int) (w Int)) Bool
    (and 
        (= b 9)
        (= w 10)
    )
)


(define-fun LAST_BLACK ((b Int) (w Int)) Bool
    (and 
        (= b 1)
        (= w 0)
    )
)

(define-fun LAST_WHITE ((b Int) (w Int)) Bool
    (and 
        (= b 0)
        (= w 1)
    )
)

(define-fun TRANS ((b Int) (bp Int) (w Int) (wp Int)) Bool
    (and
        (<= 0 bp) (<= 0 wp) (<= bp 19) (<= wp 19)
        (or
            (and (= bp (+ b 1)) (= wp (- w 2)))
            (and (= bp (- b 1)) (= wp w))
            (and (= w wp) (= bp (- b 1)))
        )
    )
)

; Since there are 19 balls, after 18 moves only one ball will be left
(declare-const b0 Int)
(declare-const w0 Int)
(declare-const b1 Int)
(declare-const w1 Int)
(declare-const b2 Int)
(declare-const w2 Int)
(declare-const b3 Int)
(declare-const w3 Int)
(declare-const b4 Int)
(declare-const w4 Int)
(declare-const b5 Int)
(declare-const w5 Int)
(declare-const b6 Int)
(declare-const w6 Int)
(declare-const b7 Int)
(declare-const w7 Int)
(declare-const b8 Int)
(declare-const w8 Int)
(declare-const b9 Int)
(declare-const w9 Int)
(declare-const b10 Int)
(declare-const w10 Int)
(declare-const b11 Int)
(declare-const w11 Int)
(declare-const b12 Int)
(declare-const w12 Int)
(declare-const b13 Int)
(declare-const w13 Int)
(declare-const b14 Int)
(declare-const w14 Int)
(declare-const b15 Int)
(declare-const w15 Int)
(declare-const b16 Int)
(declare-const w16 Int)
(declare-const b17 Int)
(declare-const w17 Int)
(declare-const b18 Int)
(declare-const w18 Int)

(assert (PRE b0 w0))
(assert (TRANS b0 b1 w0 w1))
(assert (TRANS b1 b2 w1 w2))
(assert (TRANS b2 b3 w2 w3))
(assert (TRANS b3 b4 w3 w4))
(assert (TRANS b4 b5 w4 w5))
(assert (TRANS b5 b6 w5 w6))
(assert (TRANS b6 b7 w6 w7))
(assert (TRANS b7 b8 w7 w8))
(assert (TRANS b8 b9 w8 w9))
(assert (TRANS b9 b10 w9 w10))
(assert (TRANS b10 b11 w10 w11))
(assert (TRANS b11 b12 w11 w12))
(assert (TRANS b12 b13 w12 w13))
(assert (TRANS b13 b14 w13 w14))
(assert (TRANS b14 b15 w14 w15))
(assert (TRANS b15 b16 w15 w16))
(assert (TRANS b16 b17 w16 w17))
(assert (TRANS b17 b18 w17 w18))

(push)
(assert (LAST_BLACK b18 w18))
(echo "The last ball left is black: ")
(check-sat)
(pop)

(push)
(assert (LAST_WHITE b18 w18))
(echo "")
(echo "The last ball left is white: ")
(check-sat)
(pop)


