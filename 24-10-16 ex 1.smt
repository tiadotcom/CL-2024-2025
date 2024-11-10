(declare-const p Bool)
(declare-const q Bool)

; first formula
(push)
(assert (=> (=> p q) (not p)))

; first formula can also be written as:
(assert (=>
            (=> p q)
            (not p)
        )
)
(check-sat) ; we check that this is consistent
(get-model) ; we get the satisfying assignment
(pop)

; second formula
(push)
(assert (and (or p q) (=> p q)))
(assert (and (or p q) (or (not q)p)))
(assert (and (or p q) (not (and p q))))
(check-sat)
(get-model)
(pop)

; third formula
(push)
(declare-const r Bool)
(assert (and (or (not p) (not q)) (or (not p) r)))
(assert (and (or (not p) (not q)) (or (not q) r)))
(check-sat)
(get-model)
(pop)
