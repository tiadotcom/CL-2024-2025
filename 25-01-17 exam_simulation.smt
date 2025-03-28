; PART I: QUESTIONS

; Ex 1.1
; Unary predicates: S
; Binary predicates: R
; Unary function symbols: f, g
; Binary function symbols: h

; Ex 1.2
; When we skolemize we introduce a new constant

; Ex 1.3
; If we are in the state (V|F|*) we can pass to the state (V, l[p]|F, Dvl|*) if:
; (i) -D & -l is T-inconsistent
; (ii) l hasn't been assigned yet in V
; (iii) V |= -Dd

; Ex 1.4
; Only EUF and LRA are convex


; PART II: EXERCISES TO BE SOLVED MANUALLY

; Ex 2.1
; The formula is (-p & -r --> q) & (r & -p --> s) --> (-s --> (p V q))
; For clarity, I rewrite it adding some brackets:  (((-p & -r) --> q) & ((r & -p) --> s)) --> (-s --> (p V q))
; To prove that it is a tautology, I negate it; after Resolution or CDCL I should get unsat
; - [(((-p & -r) --> q) & ((r & -p) --> s)) --> (-s --> (p V q))]
; ((-p & -r) --> q) & ((r & -p) --> s) & -(-s --> (p V q))
; (-(-p & -r) V q) & (- (r & -p) V s) & -(s V p V q)
; (p V r V q) & (-r V p V s) & -s & -p & -q
; Now the formula is in CNF so I can apply Resolution to the following set of clauses:
; 1) p V r V q
; 2) -r V p V s
; 3) -s
; 4) -p
; 5) -1
; Resolution between clause 2) and clause 3) gives clause 6) -r V p
; Resolution between clause 6) and clause 4) gives clause 7) -r
; Resolution between clause 1) and clause 5) gives clause 8) p V -r
; Resolution between clause 8) and clause 4) gives clause 9) r
; Resolution between clause 9) and clause 7) gives the empty clause
; Since I found the empty clause, I can exit the procedure with UNSAT (hence, the formula is a tautology)

; Ex 2.2
; "Peter doesn't like anyone Maria dates" can be rewritten as Ax(D(x) --> -L(x))
; "Maria is not dating Andrew" can be rewritten as -D(a)
; "Peter doesn't like Andrew" can be rewritten as -L(a)
; Since I want to check whether the inference is correct or not, I negate the conclusion: --L(a), which becomes L(a)
; Skolemization is not needed because there are no existential quantifiers
; The Herbrand Universe contains only the constant "a". Thus, the ground formulae are:
; 1) D(a) --> -L(a)
; 2) -D(a)
; 3) L(a)
; I now bring the formulae into CNF:
; 1) -D(a) V -L(a)
; 2) -D(a)
; 3) L(a)
; Finally, I apply ground Resolution:
; Resolution between clause 1) and clause 3) gives -D(a), which I already knew thanks to clause 2)
; No further resolution can be done: the exit is SAT. Since the exit is SAT, the inference is not correct

; Ex 2.3
; I have the following clauses: 
; 1) x+y>2
; 2) y<1
; 3) (x<0) V (2x+y<3)
; I start the CDCL(LRA) procedure:
; (empty set | 1-3 | *) propagate
; (x+y>2 [1] | 1-3 | *) propagate
; (x+y>2 [1], y<1 [2] | 1-3 | *) decide
; (x+y>2 [1], y<1 [2], 2x+y<3 [d] | 1-3 | *)
; I check if V is LRA-consistent:
; I isolate y and obtain: y>2-x, y<1 and y<3-2x
; By doing all possible combinations I obtain: 2-x<1 and 2-x<3-2x
; I then isolate x and obtain x>1 and x<1, which yields to 1<1 
; Since 1</1, the current valuation is LRA-inconsistent. Thus, I go to T-conflict state
; (x+y>2 [1], y<1 [2], 2x+y<3 [d] | 1-3 | (x<0) V (2x+y<3)) explain
; (x+y>2 [1], y<1 [2], 2x+y<3 [d] | 1-3 | 2x+y</3) backjump and learn clause 4) 2x+y</3
; (x+y>2 [1], y<1 [2], 2x+y</3 [4] | 1-3 | 2x+y</3) propagate
; (x+y>2 [1], y<1 [2], 2x+y</3 [4], x<0 [d] | 1-3 | 2x+y</3) 
; I check if V is LRA-consistent:
; I isolate x and obtain: x>2-y and x<0 (I temporarely disregard y<1)
; This yields 2-y<0, i.e. y>2
; Now I have y>2 and y<1, which leads to 2<1
; Since 2</1, the current valuation is LRA-inconsistent.
; Since T-conflict state is entered without decided literals, the exit is UNSAT


; PART III: EXERCISES TO BE SOLVED WITH Z3

; Ex 3.1
; Z3 solution for exercise 2.1:
(push)
(declare-const p Bool)
(declare-const r Bool)
(declare-const q Bool)
(declare-const s Bool)
(assert (not (=> (and (=> (and (not p) (not r)) q) (=> (and r (not p)) s)) (=> (not s) (or p q)))))
(echo "Ex 2.1")
(check-sat)
(pop)
; Z3 solution for exercise 2.2
(push)
(declare-sort D)
(declare-const Andrew D)
(declare-fun M_Dates (D) Bool)
(declare-fun P_Likes (D) Bool)
(assert (forall ((x D)) (=> (M_Dates x) (not (P_Likes x)))))
(assert (not (M_Dates Andrew)))
(assert (not (not (P_Likes Andrew)))) ; negation of the conclusion
(echo "")
(echo "Ex 2.2")
(check-sat) ; the exit is SAT, so the inference is not correct
(pop)

; Ex 3.2
(push)
(declare-const rw Int) ; rabbit's weight
(declare-const cw Int) ; cat's weight
(declare-const dw Int) ; dog's weight
(assert (= (+ rw cw) 10))
(assert (= (+ rw dw) 20))
(assert (= (+ dw cw) 24))
(echo "")
(echo "Ex 3.2")
(check-sat)
(get-value (rw cw dw))
(declare-const rn Int) ; number of rabbits
(declare-const cn Int) ; number of cats
(declare-const dn Int) ; number of dogs
(declare-const p Int) ; profit
(assert (<= 0 rn))
(assert (<= 0 cn))
(assert (<= 0 dn))
(assert (>= 80 (+ (* rw rn) (* cw cn) (* dw dn))))
(assert (= p (+ (* rn 1) (* cn 3) (* dn 10))))
(maximize p)
(check-sat)
(get-value (rn cn dn p))
(pop)

; Ex 3.3
(push)
(declare-const rod1 (List Int)) 
(declare-const rod2 (List Int))
(declare-const rod3 (List Int))

(define-fun PRE ((rod1 (List Int)) (rod2 (List Int)) (rod3 (List Int))) Bool
    (and
        (= rod1 (insert 1 (insert 2 (insert 3 nil))))
        (= rod2 nil)
        (= rod3 nil)
    )
)

(define-fun POST ((rod1 (List Int)) (rod2 (List Int)) (rod3 (List Int))) Bool
    (and
        (= rod3 (insert 1 (insert 2 (insert 3 nil))))
        (= rod2 nil)
        (= rod1 nil)
    )
)

(define-fun R ((rod (List Int))) Bool ; this function states the conditions for a rod to receive a disk
    (or
        (= rod nil)                  ; the rod is empty or
        (= (tail rod) nil)           ; the rod already has 1 disk or
        (= (tail (tail rod)) nil)    ; the rod already has 2 disks
    )
)

(define-fun MOVEDISK ((fromRod (List Int)) (toRod (List Int)) (fromRodp (List Int)) (toRodp (List Int))) Bool
    (and
        (R toRod) (not (= fromRod nil))
        (= fromRodp (tail fromRod))
        (= toRodp (insert (head fromRod) toRod))
    )
)

(define-fun TRANS ((rod1 (List Int)) (rod2 (List Int)) (rod3 (List Int)) 
        (rod1p (List Int)) (rod2p (List Int)) (rod3p (List Int))) Bool
                (or
                    (MOVEDISK rod1 rod2 rod1p rod2p)
                    (MOVEDISK rod1 rod3 rod1p rod3p)
                    (MOVEDISK rod2 rod1 rod2p rod1p)
                    (MOVEDISK rod2 rod3 rod2p rod3p)
                    (MOVEDISK rod3 rod1 rod3p rod1p)
                    (MOVEDISK rod3 rod2 rod3p rod2p)
                )
)

(declare-const rod10 (List Int))
(declare-const rod20 (List Int))
(declare-const rod30 (List Int))

(declare-const rod11 (List Int))
(declare-const rod21 (List Int))
(declare-const rod31 (List Int))

(declare-const rod12 (List Int))
(declare-const rod22 (List Int))
(declare-const rod32 (List Int))

(declare-const rod13 (List Int))
(declare-const rod23 (List Int))
(declare-const rod33 (List Int))

(declare-const rod14 (List Int))
(declare-const rod24 (List Int))
(declare-const rod34 (List Int))

(declare-const rod15 (List Int))
(declare-const rod25 (List Int))
(declare-const rod35 (List Int))

(declare-const rod16 (List Int))
(declare-const rod26 (List Int))
(declare-const rod36 (List Int))

(assert (PRE rod10 rod20 rod30))
(assert (TRANS rod10 rod20 rod30 rod11 rod21 rod31))
(assert (TRANS rod11 rod21 rod31 rod12 rod22 rod32))
(assert (TRANS rod12 rod22 rod32 rod13 rod23 rod33))
(assert (TRANS rod13 rod23 rod33 rod14 rod24 rod34))
(assert (TRANS rod14 rod24 rod34 rod15 rod25 rod35))
(assert (TRANS rod15 rod25 rod35 rod16 rod26 rod36))
(assert (POST rod16 rod26 rod36))

(echo "")
(echo "Ex 3.3")
(check-sat)
(echo "Before: ")
(get-value (rod10 rod20 rod30))
(echo "After:")
(get-value (rod16 rod26 rod36))
(pop)










