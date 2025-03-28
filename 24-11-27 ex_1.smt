; Peter bought only inexpensive toys
; Electric trains are expensive toys
; ----------
; Peter did not buy any electric train

; (declare-datatypes () ((D Peter)))
(declare-sort D)
(declare-const Peter D)
(declare-sort T) ; T = toys
(declare-fun Expensive (T) Bool)
(declare-fun Buys (D T) Bool)
(declare-fun ET (T) Bool) ; ET = electric train

(assert (forall ((x T)) (=> (Buys Peter x) (Expensive x))))
(assert (forall ((x T)) (=> (ET x) (Expensive x))))
(assert (not (forall ((x T)) (=> (Buys Peter x) (not (ET x))))))  ; negation of the conclusion

(check-sat)