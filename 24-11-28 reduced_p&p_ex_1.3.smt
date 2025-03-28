; ((p → q∨r)) → (p∨q∨r)

(declare-const p Bool)
(declare-const q Bool)
(declare-const r Bool)

(assert (not (=>
        (=> p (or q r))
        (or p q r)
        ))
)
(check-sat)