; Show that the following formulae are logically equivalent
; p ∨ q → r and (p → r) ∧ (q → r)

(declare-const p Bool)
(declare-const q Bool)
(declare-const r Bool)

; The two formulae should have the same model
(push)
(assert (=> (or p q) r))
(check-sat)
(get-model)
(pop)

(push)
(assert (and (=> p r) (=> q r)))
(check-sat)
(get-model)
(pop)