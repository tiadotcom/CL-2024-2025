(declare-const a Bool)
(declare-const b Bool)
(declare-const c Bool)

; (assert (or (and ((not a) b (not c))) (and a b (not c)) (and a b c)))
; (assert (or (and a b) (and b (not c))))

(assert(not 
    (= ; "=" means "<-->". We negate that they are equivalent, and we should get unsat
        (or (and (not a) b (not c)) (and a b (not c)) (and a b c)) 
        (or (and a b) (and b (not c)))
    )
))

(check-sat)
