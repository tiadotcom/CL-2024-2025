; We show that 3 colors are sufficient to color the fragment of the European country map
; comprising Italy, Switzerland, France, Austria, Germany

(define-fun xor3 ((x Bool) (y Bool) (z Bool)) Bool
	(and
		(or x y z)
		((_ at-most 1) x y z)
	)
)

; Nodes
; We start with declaration
(declare-const Italy1 Bool) ; Italy is colored by color 1
(declare-const Italy2 Bool) ; Italy is colored by color 2
(declare-const Italy3 Bool) ; Italy is colored by color 3
(assert (xor3 Italy1 Italy2 Italy3))

(declare-const Switzerland1 Bool)
(declare-const Switzerland2 Bool)
(declare-const Switzerland3 Bool)
(assert (xor3 Switzerland1 Switzerland2 Switzerland3))

(declare-const France1 Bool)
(declare-const France2 Bool)
(declare-const France3 Bool)
(assert (xor3 France1 France2 France3))

(declare-const Austria1 Bool)
(declare-const Austria2 Bool)
(declare-const Austria3 Bool)
(assert (xor3 Austria1 Austria2 Austria3))

(declare-const Germany1 Bool)
(declare-const Germany2 Bool)
(declare-const Germany3 Bool)
(assert (xor3 Germany1 Germany2 Germany3))

; Edges
; We state that two countries that share a border cannot have the same color
(assert (not (and Germany1 Switzerland1))) ; Germany and Switzerland must have different colors 
(assert (not (and Germany2 Switzerland2)))
(assert (not (and Germany3 Switzerland3)))

(assert (not (and Germany1 France1)))
(assert (not (and Germany2 France2)))
(assert (not (and Germany3 France3)))

(assert (not (and Germany1 Austria1)))
(assert (not (and Germany2 Austria2)))
(assert (not (and Germany3 Austria3)))

(assert (not (and Italy1 Austria1)))
(assert (not (and Italy2 Austria2)))
(assert (not (and Italy3 Austria3)))

(assert (not (and Italy1 Switzerland1)))
(assert (not (and Italy2 Switzerland2)))
(assert (not (and Italy3 Switzerland3)))

(assert (not (and Italy1 France1)))
(assert (not (and Italy2 France2)))
(assert (not (and Italy3 France3)))

(assert (not (and Switzerland1 France1)))
(assert (not (and Switzerland2 France2)))
(assert (not (and Switzerland3 France3)))

(assert (not (and Switzerland1 Austria1)))
(assert (not (and Switzerland2 Austria2)))
(assert (not (and Switzerland3 Austria3)))

(check-sat)
(get-model)

; If I get unsat, it means that 3 colors are not enough


