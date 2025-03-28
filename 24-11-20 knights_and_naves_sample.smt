; A very special island is inhabited only by knights and knaves. 
; Knights always tell the truth, and knaves always lie.
; You meet three inhabitants: Zoey, Peggy and Mel.
; Zoey says that it’s not the case that Mel is a knave. 
; Peggy tells you that Mel and Zoey are both knights. 
; Mel says that Zoey is a knight or Peggy is a knave.
; Can you determine who is a knight and who is a knave?

(declare-sort D) ; it is not suggested to use declare-datatypes in this case
(declare-const Z D)
(declare-const P D)
(declare-const M D)
(declare-fun Knight (D) Bool)
(declare-fun Knave (D) Bool)
(assert (forall ((x D)) (= (not (Knight x)) (Knave x)))) ; among booleans, "=" means "if an only if". This line is saying that people are either knights or knaves
; the above assertion could have also been written by using the xor function

; Zoey assertion holds iff Zoey is a knight, i.e. Zoey is a knight if and only if Mel is 
(assert (= (Knight Z) (not (Knave M))))

; Peggy assertion holds iff Peggy is a knight, i.e. Peggy is a knight if and only if bothe Mel and Zoey are
(assert (= (Knight P) (and (Knight M) (Knight  Z))))

; Mel assertion holds iff Mel is a knight, i.e. Mel is a knight if and only if Zoey is a knight or Peggy is a knave
(assert (= (Knight M) (or (Knight Z) (Knave P))))

(check-sat)
(get-value ((Knight Z) (Knight P) (Knight M))) ; the solver returns jsut the values of the terms and not the entire model

; let us now check that the solution is uniquely determined
(assert (not (and (Knight Z) (Knight P) (Knight M))))
(check-sat)
