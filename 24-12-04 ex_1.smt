; I need to buy marker pens and I can spend at most $ 100. 
; They sell: small boxes (containing 5 items) for $ 3, medium boxes (containing 10 items) for $ 5 and big boxes (containing 20 items) for $ 8. 
; Check that 245 is the maximum number of marker pens I can buy

(declare-const small Int)
(declare-const medium Int)
(declare-const big Int)
(assert (>= small 0))
(assert (>= medium 0))
(assert (>= big 0))

(declare-const bought Int) ; "bought" stores the numbers of markers bought
(assert (= bought (+ (* 5 small) (* 10 medium) (* 20 big)))) ; the number of markers is equal to the sum of the markers contained in each box
(assert (>= 100 (+ (* 3 small) (* 5 medium) (* 8 big)))) ; the total cost is equal to the sum of the costs of the boxes

(push)
(maximize bought)
(check-sat)
(get-objectives)
(pop)