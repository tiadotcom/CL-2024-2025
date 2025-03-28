; Pizza a: mushrooms e potatoes 
; Pizza b: mushrooms and olives
; Pizza c: capers and olives
; Pizza d: anchovies and capers
; Pizza e: olives and anchovies
; Pizza f: potatoes and olives

(declare-datatypes () ((persons A B C D E F)) )
(declare-datatypes () ((pizzas a b c d e f)) )
(declare-fun spends (persons) Real)
(declare-fun eats (persons) pizzas)

(declare-fun eated_by (pizzas) persons)

(assert(forall ((x persons)) (= x (eated_by (eats x))) ))
(declare-fun costs (pizzas) Real)
(assert(= 9 (costs a)))
(assert(= 9.5 (costs b)))
(assert(= 7.5 (costs c)))
(assert(= 8 (costs d)))
(assert(= 8.5 (costs e)))
(assert(= 7 (costs f)))

; If x eats pizza y and pizza y costs z, then x spends z
(assert (forall ((x persons) (y pizzas) (z Real)) (=> (and (= y (eats x)) (= z (costs y))) (= z (spends x)))))

; A and B spend as E and F
(assert(= (+ (spends A) (spends B))(+ (spends E) (spends F))))

; B spends less than A
(assert (< (spends B) (spends A)))

; C eats b c or e
(assert (or (= b (eats C)) (= c (eats C)) (= e (eats C))))

; D eats a or b
(assert (or (= a (eats D)) (= b (eats D))))

;  E too
(assert (or (= a (eats E)) (= b (eats E))))

; F eats first or last kind of pizzas
(assert (or (= a (eats F)) (= f (eats F))))

(check-sat)
(get-value ((eated_by c)))

; Test uniqueness of the solution:
(assert(not(= C (eated_by c))))

; This gives unsat
(check-sat)