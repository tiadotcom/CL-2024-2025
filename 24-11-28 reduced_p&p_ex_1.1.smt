; (p ∧ q → r)∧(r∨p → s) →((q →¬s) →(p→¬q))

(declare-const p Bool)
(declare-const q Bool)
(declare-const s Bool)
(declare-const r Bool)
(assert (not (=>
        (and 
            (=> (and p q) r) 
            (=> (or r p) s)
        )
        (=> 
            (=> q (not s)) 
            (=> p (not q))
        ))
        )
)
(check-sat)
