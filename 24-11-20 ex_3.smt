; A very special island is inhabited only by knights and knaves. Knights always tell the truth, and knaves always lie. 
; You meet two inhabitants: Zed and Alice. 
; Zed tells you, “I am a knight or Alice is a knave.” 
; Alice tells you, “Of Zed and I, exactly one is a knight.” 
; Can you determine who is a knight and who is a knave?

(declare-sort D)
(declare-const Z D) 
(declare-const A D)
(declare-fun Knight (D) Bool)
(declare-fun Knave (D) Bool)

(assert (forall ((x D)) (= (Knight x) (not (Knave x)))))
(assert (= (Knight Z) (or (Knight Z) (Knave A))))
(assert (= (Knight A) (xor (Knight Z) (Knight A))))
; (assert (= (Knight A) (and ((_ at-most 1) (Knight A) (Knight Z)) ((_ at-least 1) (Knight A) (Knight Z)))))

(check-sat)
(get-value ((Knight Z) (Knight A)))

; Uniqueness of solution
(assert (not (and (Knight A) (Knave Z))))
(check-sat)
