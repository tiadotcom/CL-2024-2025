(declare-const x Int)
(assert (= x (mod 5 3)))
(check-sat)
(get-model)