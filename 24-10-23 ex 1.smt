; Check that the following formula is a tautology:
; (p → q ∧ r) → (p → q) ∧ (p → r)

(declare-const p Bool)
(declare-const q Bool)
(declare-const r Bool)

(assert (not (=> (=> p (and q r)) (and (=> p q) (=> p r)))))

(check-sat)
; If we get unsta the formula is a tautology
