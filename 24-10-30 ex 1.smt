(push)
(declare-const t Bool)
(declare-const r Bool)
; r --> t
; not r
; not t 

(assert (=> t r))
(assert (not r))
(assert (not (not t))) ; negation of the conclusion

(check-sat)
(pop)

(push)
(declare-const p Bool) ; paul
(declare-const t Bool) ; peter
(declare-const m Bool)
(declare-const j Bool)
(declare-const a Bool)

(assert (=> p (and m j)))
(assert (=> j (and (not t) (not a))))
(assert (not (=> (or t a) (not p)))) ; negation of the conclusion

(check-sat)
(pop)
