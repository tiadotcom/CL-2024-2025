(declare-const C9 Bool)
(declare-const C10 Bool)
(declare-const C11 Bool)
(declare-const H9 Bool)
(declare-const H10 Bool)
(declare-const H11 Bool)
(declare-const L9 Bool)
(declare-const L10 Bool)
(declare-const L11 Bool)
(declare-const A9 Bool)
(declare-const A10 Bool)
(declare-const A11 Bool)
(declare-const P9 Bool)
(declare-const P10 Bool)
(declare-const P11 Bool)

; (assert ((_at-most 1) C9 C10 C11))
; (assert ((_at-most 1) H9 H10 H11))
; (assert ((_at-most 1) L9 L10 L11))
; (assert ((_at-most 1) A9 A10 A11))
; (assert ((_at-most 1) P9 P10 P11))
(xor 
  (and C9 (not C10) (not C11))
  (and (not C9) C10 (not C11))
  (and (not C9) (not C10) C11)
)
(xor 
  (and L9 (not L10) (not L11))
  (and (not L9) L10 (not L11))
  (and (not L9) (not L10) L11)
)
(xor 
  (and A9 (not A10) (not A11))
  (and (not A9) A10 (not A11))
  (and (not A9) (not A10) A11)
)
(xor 
  (and H9 (not H10) (not H11))
  (and (not H9) H10 (not H11))
  (and (not H9) (not H10) H11)
)
(xor 
  (and P9 (not P10) (not P11))
  (and (not P9) P10 (not P11))
  (and (not P9) (not P10) P11)
)


; (assert (not (and C9 H9 A9)))
; (assert (not (and C10 H10 A10)))
; (assert (not (and C11 H11 A11)))
(assert (xor C9 H9 A9))
(assert (xor C10 H10 A10))
(assert (xor C11 H11 A11))
(assert (xor L9 P9))
(assert (xor L10 P10))
(assert (xor L11 P11))
(assert (not C9))
(assert (not H9))
(assert (xor C10 H10))
(assert (xor C11 H11))

(check-sat)
(get-model)

