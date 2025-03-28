; We have the following set of clauses:
; 1) x<1 V x<y
; 2) 1<z
; 3) z<=x V y<x
; 4) 2<y

; We rewrite the clauses in the following way:
; 1) x-0<=0 V x-y<=-1 
; 2) 0-z<=-2
; 3) z-x<=0 V y-x<=-1
; 4) 0-y<=-3

; We start the CDCL(IDL) procedure:

; (empty set | 1-4 | *) propagate twice
; (0-z<=-2 [2], 0-y<=-3 [4] | 1-4 | *) decide
; (0-z<=-2 [2], 0-y<=-3 [4], y-x<=-1 [d] | 1-4 | *) T-propagate

; We want to T-propagate x-0</=0. In fact, 0-z<=-2 & 0-y<=-3 & y-x<=-1 & x-0<=0 is not IDL-satisfiable 
; At this aim, we notice that there is a cycle x --> y --> 0 --> x with weight -1 + (-3) + 0 = -4 < 0
; We add clause 5) 0-z</=-2 V 0-y</=-3 V y-x</=-1 V x-0</=0
; Notice that we will rewrite x-0</=0 as 0-x<=-1

; (0-z<=-2 [2], 0-y<=-3 [4], y-x<=-1 [d], 0-x<=-1 [5] | 1-5 | *) propagate
; (0-z<=-2 [2], 0-y<=-3 [4], y-x<=-1 [d], 0-x<=-1 [5], x-y<=-1 [1] | 1-5 | *) T-conflict

; We go to conflict because the set of clauses {y-x<=-1, x-y<=-1} is IDL-inconsistent
; At this aim, we notice that the cycle x --> y --> x has weight -1 + (-1) = 0 
; The conflict clause is 6) y-x</=-1 V x-y</=-1

; (0-z<=-2 [2], 0-y<=-3 [4], y-x<=-1 [d], 0-x<=-1 [5], x-y<=-1 [1] | 1-6 | y-x</=-1 V x-y</=-1) explain
; (0-z<=-2 [2], 0-y<=-3 [4], y-x<=-1 [d], 0-x<=-1 [5], x-y<=-1 [1] | 1-6 | y-x</=-1 V x-0<=0) ...?


