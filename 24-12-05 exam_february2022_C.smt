; Exam - February 2022 - Version C - Ex 1.1
; (Q) Suppose we are given a language L consisting of a ternary predicate D, a unary predicate P and one individual constant a.
;     What are the ground atomic formulae that can be written in this language?
; (A) They are: D(a, a, a), P(a) and a
; (Q) Which ones among the following sentences are in prenex normal form? ∀y(D(y, a, a) → P(y)), ∀x(P(x) → ∃y D(x, x, y)), ∀x ∃y ∀z D(x, y, z)
; (A) The 1st one and the 3rd one

; --------------------------------------------------------------------------------------------------------

; Exam - February 2022 - Version C - Ex 1.2
; (Q) Which one among the following formulae is in conjunctive normal form? q ∧ (p ∨ q), p ∨ ¬q ∨ (s ∧ ¬r), ¬(p → q) → r
; (A) The first one
; (Q) Bring to CNF the above formulae which are not in CNF
; (A) p ∨ ¬q ∨ (s ∧ ¬r) becomes p ∨ ((-q V s) ∧ (-q V -r)) becomes (p V -q V s) ∧ (p V -q V -r)
;     ¬(p → q) → r becomes (-(-(-p V q)) V r) becomes -p V q V r

(echo "Exercise 1.2")
(declare-const q Bool)
(declare-const p Bool)
(declare-const r Bool)
(declare-const s Bool)

(assert (= (=> (not (=> p q)) r) (or (not p) q r)))
(assert (= (or p (not q) (and s (not r))) (and (or p (not q) s) (or p (not q) (not r)))))
(check-sat)

; --------------------------------------------------------------------------------------------------------

; Exam - February 2022 - Version C - Ex 1.3
; (Q) Formulate the statement of the Refutational Completeness Theorem for Ground Resolution.
; (A)  If T is a set of statements that are universal closures of clauses, then T is unsatisfiable (i.e. has no model) 
;      if and only if the empty clause belongs to R(gr(T))

; --------------------------------------------------------------------------------------------------------

; Exam - February 2022 - Version C - Ex 1.4
; (Q) Congruence Closure decides the satisfiability of:
;     (a) a finite set of sentences in prenex normal form;
;     (b) a finite set of universal sentences;
;     (c) a finite set of arbitrary formulae;
;     (d) a finite set of literals.
; (A) Congruence Closure decides satisfiability of finite sets of literals

; --------------------------------------------------------------------------------------------------------

; Exam - February 2022 - Version C - Ex 2.1
; (Q) Determine whether the following formula is a tautology or not (negate it, bring it to conjunctive normal form and apply CDCL):
;     (((q → r) → r) → p) → (q → p)
; (A) ~((((q -> r) -> r) -> p) -> (q -> p))
;     (((q -> r) -> r) -> p) & ~(q -> p)
;     (~((q -> r) -> r) V p) & q & ~p
;     ((q -> r) & ~r) V p) & q & ~p
;     ((~q V r) & ~r) V p) & q & ~p
;     (~q V r V p) & (~r V p) & q & ~p
;     CDCL
;     1) -q V r V p
;     2) -r V p
;     3) q
;     4) -p
;     (0 | 1-4 | *) propagate twice
;     (q[3], -p[4] | 1-4 | *) propagate
;     (q[3], -p[4], -r[2] | 1-4 | *) conflict
;     (q[3], -p[4], -r[2] | 1-4 | -q V r V p) explain (resolution with clause 2)
;     (q[3], -p[4], -r[2] | 1-4 | -q V p) explain (resolution with clause 4)
;     (q[3], -p[4], -r[2] | 1-4 | -q) explain (resolution with clause 3)
;     (q[3], -p[4], -r[2] | 1-4 | empty clause) failure 
;     Since the empty clause was found, the result is unsat and the formula is a tautology


; --------------------------------------------------------------------------------------------------------

; Exam - February 2022 - Version C - Ex 2.2
; (Q) Determine whether the following inference is correct or not:
;     Some snakes are dangerous animals
;     Dangerous animals should be avoided
;     Hence
;     Some snakes should be avoided
; (A) Ex(S(x) & D(x))
;     Ax(D(x) --> A(x))
;     -Ex(S(x) & A(x))
;     PNF
;     Ex(S(x) & D(x))
;     Ax(D(x) --> A(x))
;     Ax(-S(x) V -A(x))
;     Skolemization
;     S(a) & D(a)
;     Ax(D(x) --> A(x))
;     Ax(-S(x) V -A(x))
;     CNF
;     S(a) & D(a)
;     -D(x) V A(x)
;     -S(x) V -A(x)
;     Instantiation (the Herbrand universe contains only a)
;     S(a) & D(a)
;     -D(a) V A(a)
;     -S(a) V -A(a)
;     Resolution
;     1) S(a)
;     2) D(a)
;     3) -D(a) V A(a)
;     4) -S(a) V -A(a)
;     Resolution 1-4 gives 5) -A(a)
;     Resolution 2-3 gives 6) A(a)
;     Resolution 5-6 gives the empty clause
;     We found unsat, thus the inference is correct


(push)
(declare-sort D)
(declare-fun S (D) Bool)
(declare-fun A (D) Bool)
(declare-fun D (D) Bool)

(assert (exists ((x D)) (and (S x) (D x))))
(assert (forall ((x D)) (=> (D x) (A x))))
(assert (not (exists ((x D)) (and (S x) (A x)))))

(echo "")
(echo "Exercise 2.2")
(check-sat)
(pop)

; --------------------------------------------------------------------------------------------------------










