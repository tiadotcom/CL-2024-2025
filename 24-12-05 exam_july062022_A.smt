; Exam - July 06 2022 - Version A - Ex 3.2
; A very special island is inhabited only by knights and knaves. Knights always tell the truth, and knaves always lie.
; You meet two inhabitants: Zoey and Mel. Zoey tells you that Mel is a knave. Mel says, “Neither Zoey nor I are knaves.”
; Can you determine who is a knight and who is a knave?

(push)
(declare-datatypes () ((D z m)))
(declare-fun Knight (D) Bool)
(declare-fun Knave (D) Bool)

(assert (forall ((x D)) (= (not (Knight x)) (Knave x))))
(assert (= (Knight z) (Knave m)))
(assert (= (Knight m) (and (not (Knave z)) (not (Knave m)))))

(echo "Exercise 3.2")
(check-sat)
(get-value ((Knight m) (Knight z)))
(pop)

; --------------------------------------------------------------------------------------------------------

; Exam - July 06 2022 - Version A - Ex 3.3
; Five friends, Aldo, Basilio, Cesare, Dario and Elio, organise a bowls tournament among themselves, in which each of them plays a game against the others. 
; They decide, however, to use an odd scoring system, according to which each winning player will score one point for each game won by each competitor he beats. 
; The match is won by Cesare with 5 points, while Elio scores 4, Basilio 3, Aldo 2 and Dario 0. 
; Who is the winner of the match between Basilio and Elio? 
; [Hint: use the declare-datatypes utility to declare the finite set F riends = {A, B, C, D, E} formed by the 5 friends. 
; Declare a binary function V (x, y) which takes two arguments of the sort F riends and returns 1 if x wins, 0 otherwise 
; (in the case x = y the value V (x, x) must be 0). 
; Then define two more unary functions (with integer values): p(x) gives the number of games won by x and op(x) gives the ’odd score of x’. 
; In particular, op(x) will be the sum of the values V (x, y) ∗ p(y), varying y in the set of friends.]

(push)
(declare-datatypes () ((F A B C D E)))
(declare-fun V (F F) Int)
(declare-fun p (F) Int)
(declare-fun op (F) Int)

(assert (forall ((x F) (y F)) (or (= 1 (V x y)) (= 0 (V x y)))))
(assert (forall ((x F) (y F)) (=> (= x y) (and (= 0 (V x y)) (= 0 (V y x))))))

(assert (forall ((x F)) (= (p x) (+ (V x A) (V x B) (V x C) (V x D) (V x E)))))
(assert (forall ((x F)) (= (op x) (+ (* (V x A) (p A)) (* (V x B) (p B)) (* (V x C) (p C)) (* (V x D) (p D)) (* (V x E) (p E))))))

(assert (= (op C) 5))
(assert (= (op E) 4))
(assert (= (op B) 3))
(assert (= (op A) 2))
(assert (= (op D) 0))

(echo "")
(echo "Exercise 3.3")
(check-sat)
(eval (V E B))
(pop)



