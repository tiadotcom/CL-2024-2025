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

; (1) A wants to share the room with either B or E;
(assert (=> A1 (xor B1 E1)))
(assert (=> A2 (xor B2 E2)))
(assert (=> A3 (xor B3 E3)))

; (2) B wants to share the room with either A or C;
(assert (=> B1 (xor A1 C1)))
(assert (=> B2 (xor A2 C2)))
(assert (=> B3 (xor A3 C3)))

; (3) C wants to share the room with either B or D;
(assert (=> C1 (xor B1 D1)))
(assert (=> C2 (xor B2 D2)))
(assert (=> C3 (xor B3 D3)))

; (4) D wants to share the room with either C or E;
(assert (=> D1 (xor C1 E1)))
(assert (=> D2 (xor C2 E2)))
(assert (=> D3 (xor C3 E3)))

; (5) E wants to share the room with either D or A.
(assert (=> E1 (xor D1 A1)))
(assert (=> E2 (xor D2 A2)))
(assert (=> E3 (xor D3 A3)))

(check-sat)

