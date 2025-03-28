; Check whether the following syllogism is correct or not
; Some fans are violent persons
; No violent person is a true sportsman
; ---------------------
; No fan is a true sportman

(declare-sort D)
(declare-fun Fan (D) Bool)
(declare-fun Violent (D) Bool)
(declare-fun Sportman (D) Bool)

(assert (exists ((x D)) (and (Fan x) (Violent x))))
(assert (not (exists ((x D)) (and (Violent x) (Sportman x)))))

(assert (not (forall ((x D)) (=> (Fan x) (not (Sportman x))))))

(check-sat)