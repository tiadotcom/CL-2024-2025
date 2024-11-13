; A group of friends formed by A, B, C, D, E, wants to find an accommodation in a hotel. 
; In the hotel only three rooms are available. All such rooms can accommodate two people.
; These are the friends’ desiderata:
; (1) A wants to share the room with either B or E;
; (2) B wants to share the room with either A or C;
; (3) C wants to share the room with either B or D;
; (4) D wants to share the room with either C or E;
; (5) E wants to share the room with either D or A.
; Check whether these requirements are consistent or not. 

(define-fun xor3 ((x Bool) (y Bool) (z Bool)) Bool
    (and 
        (or x y z)
        ((_ at-most 1) x y z)
    )
)

(declare-const A1 Bool)
(declare-const A2 Bool)
(declare-const A3 Bool)
(assert (xor3 A1 A2 A3))

(declare-const B1 Bool)
(declare-const B2 Bool)
(declare-const B3 Bool)
(assert (xor3 B1 B2 B3))

(declare-const C1 Bool)
(declare-const C2 Bool)
(declare-const C3 Bool)
(assert (xor3 C1 C2 C3))

(declare-const D1 Bool)
(declare-const D2 Bool)
(declare-const D3 Bool)
(assert (xor3 D1 D2 D3))

(declare-const E1 Bool)
(declare-const E2 Bool)
(declare-const E3 Bool)
(assert (xor3 E1 E2 E3))

; All rooms are occupied by two people at most
(assert ((_ at-most 2) A1 B1 C1 D1 E1))
(assert ((_ at-most 2) A2 B2 C2 D2 E2))
(assert ((_ at-most 2) A3 B3 C3 D3 E3))

; A with  B or E
(assert (or (and A1 B1) (and A2 B2) (and A3 B3) (and A1 E1) (and A2 E2) (and A3 E3)))

; B with  A or C
(assert (or (and A1 B1) (and A2 B2) (and A3 B3) (and B1 C1) (and B2 C2) (and B3 C3)))

; C with  B or D
(assert (or (and C1 D1) (and C2 D2) (and C3 D3) (and B1 C1) (and B2 C2) (and B3 C3)))

; D with  C or E
(assert (or (and C1 D1) (and C2 D2) (and C3 D3) (and D1 E1) (and D2 E2) (and D3 E3)))

; E with  D or A
(assert (or (and E1 A1) (and E2 A2) (and E3 A3) (and D1 E1) (and D2 E2) (and D3 E3)))

(check-sat)

;to regain consistency remove one constraint from the above list, then ask for a model
;(get-model)


