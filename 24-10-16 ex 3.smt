(declare-const p Bool)
(declare-const q Bool)

(assert (and (=> p q) (not (and p q))))
(check-sat)
(get-model)

(assert q)
(check-sat)
(get-model)
