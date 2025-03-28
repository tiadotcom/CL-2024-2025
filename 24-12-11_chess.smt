; We have to write down the transition system. It has 2 variables, in this case the coordinates x and y of the position of a certain piece.
; Bottom left slot is 1,1 while top right slot is 8,8.
; Assume that now the knight is in position x,y. 
; It can move in position (|x' - x| = 2 & |y' - y| = 1) V (|x' - x| = 1 & |y' - y| = 2)

(define-fun absval ((x Int)) Int (ite (< x 0) (- x) x)) ; ite = if then else

(define-fun PRE ((x Int) (y Int)) Bool (and (= x 1) (= y 1))) ; initial position
(define-fun POST ((x Int) (y Int)) Bool (and (= x 8) (= y 8))) ; final position

(define-fun TRANS ((x Int) (y Int) (xp Int) (yp Int)) Bool ; x and y are the actual coordinates, xp and yp are the new coordinates after the move
            (and 
                (<= 1 xp) (<= 1 yp) (<= xp 8) (<= yp 8) ; the knight cannot go out of the board 
                (or 
                    (and (= (absval (- xp x)) 2) (= (absval (- yp y)) 1)) ; |x' - x| = 2 & |y' - y| = 1
                    (and (= (absval (- xp x)) 1) (= (absval (- yp y)) 2)) ; |x' - x| = 1 & |y' - y| = 2
                    (and (= xp x) (= yp y)) ; if the iteration number n is too large, this condition saves us 
                )
            )  
)

; In this specific case we need 6 moves 
(declare-const x0 Int)
(declare-const y0 Int)

(declare-const x1 Int)
(declare-const y1 Int)

(declare-const x2 Int)
(declare-const y2 Int)

(declare-const x3 Int)
(declare-const y3 Int)

(declare-const x4 Int)
(declare-const y4 Int)

(declare-const x5 Int)
(declare-const y5 Int)

(declare-const x6 Int)
(declare-const y6 Int)

(declare-const x7 Int)
(declare-const y7 Int)

(assert (PRE x0 y0))

(assert (TRANS x0 y0 x1 y1)) ; first move (from position 0 to position 1)
(assert (TRANS x1 y1 x2 y2)) ; second move (from position 1 to position 2)
(assert (TRANS x2 y2 x3 y3)) ; ...
(assert (TRANS x3 y3 x4 y4)) ; ...
(assert (TRANS x4 y4 x5 y5)) ; ...
(assert (TRANS x5 y5 x6 y6)) ; sixth move (from position 5 to position 6)

(assert (POST x6 y6))

(check-sat)

(echo " ")
(echo "Step 0")
(eval x0)
(eval y0)
(echo " ")
(echo "Step 1")
(eval x1)
(eval y1)
(echo " ")
(echo "Step 2")
(eval x2)
(eval y2)
(echo " ")
(echo "Step 3")
(eval x3)
(eval y3)
(echo " ")
(echo "Step 4")
(eval x4)
(eval y4)
(echo " ")
(echo "Step 5")
(eval x5)
(eval y5)
(echo " ")
(echo "Step 6")

(eval x6)
(eval y6)
