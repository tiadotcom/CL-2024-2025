; Exam - July 29 2024 - Ex 1.1
; Ground literal: a = b. Non-ground literal: x = a.
; R(a,x) contains both a ground and a non-ground term.

; --------------------------------------------------------------------------------------------------------

; Exam - July 29 2024 - Ex 1.2
; Ax (Ey R(x,y) --> Ey Ez x = f(y,z))
; Ax Ay (R(x,y) --> Ey Ez x = f(y,z))
; Ax Ay Ey1 Ez (R(x,y) --> x = f(y1,z)))

; --------------------------------------------------------------------------------------------------------

; Exam - July 29 2024 - Ex 1.3
; ¬R(x,y) ∨ R(y,x) and ¬R(x,y) are Horn clauses

; --------------------------------------------------------------------------------------------------------

; Exam - July 29 2024 - Ex 1.4
; Assume that we want to check whether a set T of universal formulas is satisfiable or not. What we do is: 
; 1) we ground all the sentences belonging to T, in order to obtain a set gr(T) of ground instances
; 2) we check whether gr(T) is satisfiable or not.
; (Un)satisfiability of gr(T) ensures (un)satisfiability of T.

; --------------------------------------------------------------------------------------------------------

; Exam - July 29 2024 - Ex 2.1
; 1) p ∨ ¬q
; 2) ¬p ∨ ¬q ∨ r
; 3)  q ∨ r
; 4) q ∨ ¬r
; 5) ¬r ∨ s
; 6) ¬s ∨ ¬r ∨ ¬q
; (empty set | 1-6 | *) decide
; (q[d] | 1-6 | *) propagate three times
; (q[d], p[1], r[2], ¬s[6] | 1-6 | *) conflict with clause 5)
; (q[d], p[1], r[2], ¬s[6] | 1-6 | ¬r ∨ s) explain
; Resolution between clauses 5) and 6) gives clause 7) ¬r ∨ ¬q
; (q[d], p[1], r[2], ¬s[6] | 1-7 | ¬r ∨ ¬q) explain
; Resolution between clauses 7) and 2) gives clause 8) ¬p ∨ ¬q
; (q[d], p[1], r[2], ¬s[6] | 1-8 | ¬p ∨ ¬q) explain
; Resolution between clauses 8) and 1) gives clause 9) ¬q
; (q[d], p[1], r[2], ¬s[6] | 1-8 | ¬q) backjump 
; (¬q[9] | 1-9 | *) propagate
; (¬q[9], ¬r[4] | 1-9 | *) conflict with clause 3)
; Since we entered conflict without decided literals, the exit is UNSAT

; --------------------------------------------------------------------------------------------------------

; Exam - July 29 2024 - Ex 2.2
; "There are friends of yours that are not friends of mine" becomes: Ex (Y(x) & -M(x))
; "All friends of mine like skiing" becomes: Ax (M(x) --> S(x))
; "Some friends of yours do not like skiing" becomes: Ex (Y(x) & -S(x)), to be negated as -Ex (Y(x) & -S(x))
; Bring into PNF 
; Ex (Y(x) & -M(x))
; Ax (M(x) --> S(x))
; Ax (-Y(x) V S(x))
; Skolemize 
; Y(c) & -M(c)
; Ax (M(x) --> S(x))
; Ax (-Y(x) V S(x))
; Instantiate (the Herbrand Universe contains only the constant c)
; Y(c) & -M(c)
; M(c) --> S(c)
; -Y(x) V S(x)
; Bring into CNF
; Y(c) & -M(c)
; -M(c) V S(c)
; -Y(x) V S(x)
; Apply resolution to the following clauses
; 1) Y(c)
; 2) -M(c)
; 3) -M(c) V S(c)
; 4) -Y(c) V S(c)
; Resolution between 1) and 4) gives clause 5) S(c)
; No further resolution appliable. The exit is SAT and thus the inference is NOT correct

; --------------------------------------------------------------------------------------------------------

; Exam - July 29 2024 - Ex 2.3
; Apply flattening and obtain the following set of sentences T:
; 1) f(a) = c
; 2) f(c) = d
; 3) f(d) = e
; 4) e != a V f(a) = b
; 5) f(a) = a
; 6) f(a) != a V f(a) != b
; Start CDCL(EUF)
; (empty set | 1-6 | *) propagate 4 times
; (f(a) = c [1], f(c) = d [2], f(d) = e [3], f(a) = a [5] | 1-6 | *) propagate 
; (f(a) = c [1], f(c) = d [2], f(d) = e [3], f(a) = a [5], f(a) != b [6] | 1-6 | *) propagate
; (f(a) = c [1], f(c) = d [2], f(d) = e [3], f(a) = a [5], f(a) != b [6], e != a [4] | 1-6 | *) 
; The current valuation makes T EUF-inconsistent.
; The unsat core is f(a) = c, f(c) = d, f(d) = e, f(a) = a, a != e.
; Initially there are 3 blocks: {f(a), c, a}, {f(c), d}, {f(d), e}.
; Since a and c are in the same block, f(a) = f(c). Thus merge the 1st and the 2nd block.
; Now the blocks are: {f(a), c, a, f(c), d}, {f(d), e}.
; Since c and d are in the same block, f(c) = f(d). Thus merge the two blocks.
; The current configuration is: {f(a), c, a, f(c), d, f(d), e}, where a and e are in the same block.  
; This falsifies the clause a != e, and thus the exit of the EUF procedure is UNSAT.
; Since CDCL-Conflict applied without decided literals, the exit is UNSAT

; --------------------------------------------------------------------------------------------------------

; Exam - July 29 2024 - Ex 3.1
(push)
(declare-const p Bool)
(declare-const q Bool)
(declare-const r Bool)
(declare-const s Bool)
(assert (or p (not q)))
(assert (or (not p) (not q) r))
(assert (or q r))
(assert (or q (not r)))
(assert (or (not r) s))
(assert (or (not s) (not r) (not q)))
(echo "Ex 2.1")
(check-sat)
(pop)

(push)
(declare-sort D)
(declare-fun Y (D) Bool) ; friend of Yours
(declare-fun M (D) Bool) ; friend of Mine
(declare-fun S (D) Bool) ; likes Skiing
(assert (exists ((x D)) (and (Y x) (not (M x)))))
(assert (forall ((x D)) (=> (M x) (S x))))
(assert (not (exists ((x D)) (and (Y x) (not (S x)))))) ; negation of the conclusion
(echo "")
(echo "Ex 2.2")
(check-sat)
(declare-const c D)
(get-value ((Y c) (M c) (S c)))
(pop)

; Do not include
(push)
(declare-sort D)
(declare-const a D)
(declare-const b D)
(declare-const c D)
(declare-const d D)
(declare-const e D)
(declare-fun F (D) D)
(assert (= (F a) c))
(assert (= (F c) d))
(assert (= (F d) e))
(assert (or (not (= e a)) (= (F a) b))) ; f(f(f(a))) ̸= a ∨ f(a) = b
(assert (= (F a) a)) ;  f(a) = a
(assert (or (not (= (F a) a)) (not (= (F a) b)))) ; f(a) ̸= a ∨ f(a) ̸= b 
(echo "")
(echo "Ex 2.3")
(check-sat)
(pop)       

; --------------------------------------------------------------------------------------------------------

; Exam - July 29 2024 - Ex 3.2

; Someone has been secretly eating the butcher’s sausages! The four bad boys suspected of the misdeed stated the following:
; - Andrea: Beatrice ate the sausages!
; - Beatrice: Davide ate them all!
; - Carlo: I certainly didn’t eat them!
; - Davide: Beatrice is definitely lying!
; Only one of them is telling the truth. The other three are obviously lying. Can you tell who ate the sausages?

(push)
(declare-datatypes () ((D a b c d)))
(declare-fun Honest (D) Bool)
(declare-fun Lier (D) Bool)
(declare-fun Eats (D) Bool)
(assert (forall ((x D)) (= (Honest x) (not (Lier x)))))
(assert (= (Honest a) (Eats b)))
(assert (= (Honest b) (Eats d)))
(assert (= (Honest c) (not (Eats c))))
(assert (= (Honest d) (Lier b)))
(assert ((_ at-least 1) (Honest a) (Honest b) (Honest c) (Honest d)))
(assert ((_ at-most 1) (Honest a) (Honest b) (Honest c) (Honest d)))
(assert ((_ at-least 1) (Eats a) (Eats b) (Eats c) (Eats d)))
(assert ((_ at-most 1) (Eats a) (Eats b) (Eats c) (Eats d)))

(echo "")
(echo "Ex 3.2")
(check-sat)
(get-value ((Honest a) (Honest b) (Honest c) (Honest d)))
(get-value ((Eats a) (Eats b) (Eats c) (Eats d)))
(pop)   

; --------------------------------------------------------------------------------------------------------

; Exam - July 29 2024 - Ex 3.3
(push)
(declare-const a (Array Int Bool))

(define-fun adjacent ((x Int) (y Int)) Bool 
    (and 
        (<= 1 x) (<= 1 y) (<= x 16) (<= y 16) 
        (or (= y (+ x 1)) (= y (+ x 4)))
    )
)

(define-fun twice-adjacent ((x Int) (y Int) (z Int)) Bool 
    (and 
        (<= 1 x) (<= 1 y) (<= 1 z) (<= x 16) (<= y 16) (<= z 16)
        (or 
            (and (= y (+ x 1)) (= z (+ y 1))) 
            (and (= y (+ x 4)) (= z (+ y 4))))
    )
)

(define-fun PRE ((a (Array Int Bool)) (x Int)) Bool
    (and
        (forall ((i Int)) (= 
                        (= (select a i) true)               
                        (or (= i 2) (= i 4) (= i 5) (= i 6) (= i 11) (= i 13) (= i 15)))
        )      
        (= x 1)
    )
)

(define-fun POST ((x Int)) Bool (= x 16))

(define-fun TRANS ((a (Array Int Bool)) (x Int) (ap (Array Int Bool)) (xp Int) (z Int)) Bool
    (or 
        (and 
            (adjacent x xp) 
            (= (select a xp) false) 
            (= ap a))
        (and 
            (twice-adjacent x xp z) 
            (= (select a z) false) 
            (= (select a xp) true)
            (= ap (store (store a xp false) z true))
        )
    )
)
(declare-const a0 (Array Int Bool))
(declare-const x0 Int)

(declare-const a1 (Array Int Bool))
(declare-const  x1 Int)
(declare-const  Z1 Int)

(declare-const a2 (Array Int Bool))
(declare-const  x2 Int)
(declare-const  Z2 Int)

(declare-const a3 (Array Int Bool))
(declare-const  x3 Int)
(declare-const  Z3 Int)

(declare-const a4 (Array Int Bool))
(declare-const  x4 Int)
(declare-const  Z4 Int)

(declare-const a5 (Array Int Bool))
(declare-const  x5 Int)
(declare-const  Z5 Int)

(declare-const a6 (Array Int Bool))
(declare-const  x6 Int)
(declare-const  Z6 Int)

(assert (PRE a0 x0))
(assert (TRANS a0 x0 a1 x1 Z1))
(assert (TRANS a1 x1 a2 x2 Z2))
(assert (TRANS a2 x2 a3 x3 Z3))
(assert (TRANS a3 x3 a4 x4 Z4))
(assert (TRANS a4 x4 a5 x5 Z5))
(assert (TRANS a5 x5 a6 x6 Z6))
(assert (POST x6))

(echo "")
(echo "Ex 3.3")
(check-sat)
(get-value (x0 x1 x2 x3 x4 x5 x6))
(pop)

