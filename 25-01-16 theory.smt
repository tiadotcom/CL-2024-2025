; 1 characteristic function
; the characteristic function of a subset S of a set X is the function Cs: X --> {0,1} which maps every element of X to 1 if the element belongs to S or to 0 
; if the element does not belong to S

; 2 injective function
; a function f: X-->Y is injective if different elements of the domain are mapped to different values. in symbols Ax1,x2€X s.t. (x1!=x2 --> f(x1)!=f(x2))

; 3 surjective function
; a function f: X-->Y is surjective if it covers all elements of the codomain. in symbols Ay€Y,Ex€X s.t. f(x)=y

; 4 bijective function
; a function is bijective if it is both injective and surjective. a function is bijective also if it can be inverted

; 5 strict ordering relation
; a strict ordering relation < on a set X has the following two properties: (i) irreflexivity: no element is related to itself, (ii) transitivity: 
; if x is related to y and y is related to z, then x is related to z. In symbols (i) Ax€X, x</x and (ii) Ax,y,z€X, ((x<y & y<z) --> x<z)

; 6 term
; given a language L, the set of L-terms is defined as follows:
; 1) every x € V (every variable) is a term
; 2) every c € F_0 (every constant) is a term
; 3) if f € F_n (n>=1) and t1,...,tn are terms, then f(t1,...,tn) is a term

; 7 sentence
; a sentecence is a formula in which every variable (if any) is bounded

; 8 ground formula
; a formula is ground if it contains no variables

; 9 atomic formula
; an atomic formula (an atom) is a formula with zero connectives

; 10 literal
; a literal is an atom or its negation 

; 11 unit clause
; a unit clause is a formula composed of a single unassigned literal

; 12 open/closed formula
; a formula is open if it is quantifier-free. it is closed otherwise

; 13 universal/existential formula
; a formula is universal if it is of the type Ax1...AxnB, where B is an open formula. it is existential if it is of the type Ex1...ExnB, where B is an open formula

; 14 substitution
; B(t1/x1,...,tn/xn) is the formula obtained from B(x1,...,xn) by substituting every free occurence of an xi with a ti

; 15 instance
; an instance is a formula obtained by eliminating all universal quantifiers and by subsituting all universal variables with a term

; 16 horn clause
; a horn clause is a clause (a disjunction of literals) that contains at most one positive literal. if it contains exactly one positive literal, it is definite

; 17 nnf
; a formula is in NNF if it does not contain implications and if all negations occur in front of atoms

; 18 cnf
; a formula is in CNF if it is a conjunction of disjunctions

; 19 pnf
; a formula is in PNF is all its quantifiers are outside the matrix, i.e. if it is of the type Qx1...QxnM where M is open and Q = A or E.

; 20 propositional resolution rule
; we apply prepositional resolution rule to two clauses if they contain the same atom but in different polarities (namely in one clause it is positive and
; in the other one it is negated); we then cancel that atom and merge the remainin disjuncts

; 21 ordered resolution rule
; let C_0 be a set of clauses. when we apply ordered resolution rule we decide a priori an order in the atoms appearing in C_0 and we agree that we
; apply propositional resolution rule (meaning that we cancel an atom if it appears in different polarities in two formulae) only if the atom to be canceled
; is the biggest among the ones occuring in the two formulae

; 22 decision rule of cdcl
; if we are in the state (V | F | *) we can pass to the state (V, l[d] | F | *) if:
; (i) the propagation rule and the conflict rule cannot be applied
; (ii) l or -l appears in some formula in F
; (iii) l hasn't been assigned yet in V

; 23 propagation rule of cdcl
; if we are in the state (V | F, D v l | *) we can pass to the state (V, l[p] | F, D v l | *) if:
; (i) V |= -D
; (ii) l hasn't been assigned yet in V

; 24 conflict entering rule of cdcl
; if we are in the state (V | F, C | *) we can pass to the state (V | F, C | C) if:
; (i) V |= -C

; 25 explain rule of cdcl
; if we are in the state (V | F, D v l | -l v C) we can pass to the state (V | F, D v l | D v C) if:
; V |= -D
; l was assigned in V after all the negations of the atoms appearing in D were assigned
; this rule involves a resolution step between D v l and -l v C

; 26 backjumping rule of cdcl
; if we are in the state (V1, l[d], V2 | F | C v l') we can pass to the state (V1, l'[p] | F, C v l' | *) if:
; (i) l is not assigned in V1
; (ii) V |= -C

; 27 failure rule of cdcl
; if we are in the state (V | F | C) and C is the empty clause, we can exit the procedure with UNSAT

; 28 t-propagation rule of cdcl-t
; 29 t-conflict rule of cdcl-t
; 30 t-explain rule of cdcl-t

; 31 refutational completeness theorem of propositional resolution calculus
; let C_0 be a set of clauses. we say that C_0 is unsatisfiable if the empty clause belongs to R(C_0), i.e. to the saturated set obtained by applying 
; resolution calculus to C_0.

; 32 refutational completeness theorem for ground resolution
; let T be a set of sentences that are universal closures of clauses. let gr(T) the set of all the possible instances of T. 
; we say that T is unsatisfiable if the empty clause belongs to R(gr(T)), i.e. to the saturated set obtained by applying resolution calculus to gr(T)

; 33 herbrand's theorem
; let T be a set of universal sentences. T is unsatisfiable (it has no model) if gr(T), i.e. the set of all the ground instances of T, is unsatisfiable

; 34 satisfiability criterion for a conjunction of atoms in idl
; 35 satisfiability criterion for a conjunction of literals in euf

; 36 stably infinite theory
; a theory T is stably infinite if every conjunction of literals that is T-consistent is satisfiable in a model that is infinite

; 37 sufficient condition for n-o algorithm
; nelson-oppen algorithm can be applied if the following conditions are satisfied:
; (i) disjunctness: the involved theories only share the equality symbol 
; (ii) stably infinitess: the involved theories are stably infinite

; 38 function symbols for arrays

; 39 axioms for equality
; (i) reflexivity: Ax (x = x)
; (ii) simmetry: AxAy (x=y --> y=x)
; (iii) transitivity: AxAyAz ((x=y & y=z) --> x=z)

; 40 congruence axioms
; (i) Ax1...xn Ay1...yn (&i=1,n xi=yi --> f(x1,...,xn)=f(y1,...,yn))
; (ii) Ax1...xn Ay1...yn (&i=1,n xi=yi --> (R(x1,...,xn)<-->R(y1,...,yn)))

; 41 convex theories
; a theory T is convex if it satisfies the following condition: every time T entails a conjunction of equalities, it entails one of them. 
; in other words, if a disjunction of inequalities is T-inconsistent, then at least one of the inequalities is T-inconsistent by itself

; 42 unsat core
; an unsat core is a minimal set of unsatisfiable assertions

; 43 replacement lemma
; if B_1,...,B_n are logically equivalent to B'_1, ..., B'_n, then for every formula A(x1,...,xn) it is true that
; A(B_1/x1,...,B_n/xn) is logically equivalent to A(B'_1/x1,...,B'_n/xn)

