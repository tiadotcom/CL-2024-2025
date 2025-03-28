(push)
; Exam - February 2022 - Version B - Ex 2.1
; Determine whether the following formula is a tautology or not: (((q → r) → r) → p) → (r → p)

(declare-const q Bool)
(declare-const p Bool)
(declare-const r Bool)

(assert 
    (=>
        (=> (=> (=> q r) r) p)
        (=> r p)
    )
)

(echo "Exercise 2.1")
(check-sat)
(pop)

; --------------------------------------------------------------------------------------------------------

(push)
; Exam - February 2022 - Version B - Ex 2.2
; Determine whether the following inference is correct or not:
; Some fans are violent persons
; No violent person is a true sportsman
; Hence
; Some fans are not true sportsmen

(declare-sort D)
(declare-fun V (D) Bool)
(declare-fun F (D) Bool)
(declare-fun S (D) Bool)

(assert (exists ((x D)) (and (F x) (V x))))
(assert (forall ((x D)) (=> (V x) (not (S x)))))
(assert (not (exists ((x D)) (and (F x) (not (S x))))))

(echo "")
(echo "Exercise 2.2")
(check-sat)

(pop)

; --------------------------------------------------------------------------------------------------------

(push)
; Exam - February 2022 - Version B - Ex 3.2
; Determine what I can buy from the list below spending exactly 40€, given that I want to buy at least one piece per each article:
; coke e 1.40;
; mineral water e 1.50;
; coffee e 1.10;
; sandwitch e 3.20;
; candy e 1.75.

(declare-const c Int) ; number of cokes bought
(declare-const w Int) ; number of waters bought
(declare-const f Int) ; number of coffees bought
(declare-const s Int) ; number of sandwitches bought
(declare-const n Int) ; number of candies bought

(assert (>= c 1)) ; I buy at least one coke
(assert (>= w 1)) ; I buy at least one water
(assert (>= f 1)) ; I buy at least one coffe
(assert (>= s 1)) ; I buy at least one sandwitch
(assert (>= n 1)) ; I buy at least one candy

(assert (= 4000 (+ (* c 140) (* w 150) (* f 110) (* s 320) (* n 175)))) ; prices are given in cents 

(echo "")
(echo "Exercise 3.2")
(check-sat)
(get-value (c w f s n))
(pop)





