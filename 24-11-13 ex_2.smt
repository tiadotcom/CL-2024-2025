; Determine whether the following inference is correct or not
; There are friends of yours that are not friends of mine.
; All friends of mine like skiing.
; -------------------------------- 
; Some friends of yours do not like skiing.

(declare-sort D)
(declare-fun My-Friend (D) Bool)
(declare-fun Your-Friend (D) Bool)
(declare-fun Likes-Skiing (D) Bool)

(assert (exists ((x D)) (and (Your-Friend x) (not (My-Friend x)))))
(assert (forall ((x D)) (=> (My-Friend x) (Likes-Skiing x))))

(assert (not (exists ((x D)) (and (Your-Friend x) (not (Likes-Skiing x)))))) ; negation of the conclusion
(check-sat)
