;lines (like this one) beginning with ";" are comments

;we declare 3 propositional letters p,q,r
(declare-const p Bool)
(declare-const q Bool)
(declare-const r Bool)


;we assert  (p & ~q) -> r: remember that prefix notation must always be used !
(assert (=> (and p (not q)) r))

;we check that this is consistent
(check-sat)

;we get the satisfying assignment
(get-model)
