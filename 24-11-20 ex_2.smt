; Determine whether the following interference is correct or not
; All cats are felines
; All felines have whiskers
; ----------------
; If Tom doesn't have whiskes he is not a cat

(declare-sort C)
(declare-fun Cat (C) Bool)
(declare-fun Feline (C) Bool)
(declare-fun HasWhiskers (C) Bool)
(declare-const Tom C)

(assert (forall ((x C)) (=> (Cat x) (Feline x))))
(assert (forall ((x C)) (=> (Feline x) (HasWhiskers x))))

(assert (not (=> (not (HasWhiskers Tom)) (not (Cat Tom)))))
(check-sat)