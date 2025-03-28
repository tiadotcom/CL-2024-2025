; r ∨ s, ¬r ∨ s ∨ p, ¬s ∨ r, ¬r ∨ ¬s, ¬p

(declare-const p Bool)
(declare-const r Bool)
(declare-const s Bool)

(assert (or r s))
(assert (or (not r) s p))
(assert (or (not s) r))
(assert (or (not r) (not s)))
(assert (not p))

(check-sat)
