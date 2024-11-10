(declare-const q Bool)
(declare-const p Bool)
(declare-const r Bool)
(declare-const s Bool)

(assert (or p q s))
(assert (or (not s) r))
(assert (or (not r) p))
(assert (or (not s) p))

(check-sat)
(get-model)