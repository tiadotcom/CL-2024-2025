; [Puzzle: barbershop club.] 
; There is a barbers club that looks like this:
;   - If a member X of the club cut the hair of some member of the club, then all members of the club cut X’s hair.
;   - Two club members are named Guido and Caesar.
;   - Guido cut Caesar’s hair.
; Did Caesar cut his own hair?

(declare-sort D) ; members of the club
(declare-fun CutsHair (D D) Bool)
(declare-const Guido D)
(declare-const Caesar D)

(assert (forall ((x D)) (=> (exists ((some_member D)) (CutsHair x some_member)) (forall ((all_member D)) (CutsHair all_member x)))))
(assert (CutsHair Guido Caesar))

(assert (not (CutsHair Caesar Caesar))) ; negation of the conclusion
(check-sat)




