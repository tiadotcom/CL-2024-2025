; Someone who lives in Dreadbury Mansion killed Aunt Agatha. 
; Agatha, the butler, and Charles live in Dreadbury Mansion, and are the only people who live therein. 
; A killer always hates his victim, and is never richer than his victim.
; Charles hates no one that Aunt Agatha hates. 
; Agatha hates everyone except the butler.
; The butler hates everyone not richer than Aunt Agatha.
; The butler hates everyone Aunt Agatha hates. 
; No one hates everyone.
; Agatha, Charles and the butler are different persons. 
; Therefore: Agatha killed herself.

; (declare-sort D)
; (declare-const Agatha D)
; (declare-const Butler D)
; (declare-const Charles D)
(declare-datatypes () ((D Agatha Butler Charles)))
(declare-fun Hates (D D) Bool)
(declare-fun IsRicher (D D) Bool)
(declare-fun Kills (D D) Bool)

(assert (forall ((x D)) (or (= x Agatha) (= x Butler) (= x Charles)))) ; Agatha, the butler and Charles are the only people living there
(assert (forall ((x D) (y D)) (=> (Kills x y) (Hates x y)))) ; every killer hates his victim
(assert (not (exists ((x D) (y D)) (and (Kills x y) (IsRicher x y))))) ; no killer is richer than his victim
(assert (forall ((x D)) (=> (Hates Agatha x) (not (Hates Charles x))))) ; every person hated by Agatha is not hated by Charles
(assert (and (Hates Agatha Charles) (Hates Agatha Agatha))) ; Agatha hates everyone except the butler
(assert (forall ((x D)) (=> (not (IsRicher x Agatha)) (Hates Butler x)))) ; the butler hates everyone not richer than Aunt Agatha
(assert (forall ((x D)) (=> (Hates Agatha x) (Hates Butler x)))) ; the butler hates everyone Aunt Agatha hates
(assert (not (exists ((x D)) (forall ((y D)) (Hates x y))))) ; no one hates everyone
(assert (distinct Agatha Butler Charles)) ; Agatha, Charles and the butler are different persons

(push)
(assert (not (Kills Agatha Agatha))) ; should get unsat
(check-sat)
(pop)
(push)
(assert (not (Kills Butler Agatha)))
(check-sat)
(pop)
(push)
(assert (not (Kills Charles Agatha)))
(check-sat)
(pop)


