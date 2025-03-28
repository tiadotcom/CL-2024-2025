; ¬(p ∧(q ∨((¬p∨¬r)∧r))∧(q → ¬p))

(declare-const p Bool)
(declare-const q Bool)
(declare-const r Bool)

(assert (not (and
                p
                (or q (and (or (not p) (not r)) r))
                (=> q (not p))
            )
        )
)
(check-sat)
