(declare-datatypes () ((Tiles t1 t2 t3 t4 t5 t6 t7 t8 t9)))
(declare-fun T (Tiles) Int) ; number at the top of the tile
(declare-fun B (Tiles) Int) ; number at the bottom of the tile
(declare-fun L (Tiles) Int) ; number at the left of the tile
(declare-fun R (Tiles) Int) ; number at the right of the tile
(declare-datatypes () ((Position p11 p12 p13 p21 p22 p23 p31 p32 p33)))
(declare-fun P (Position) Tiles) ; takes a position and returns the tile in that position

(assert (forall ((x Position) (y Position)) (=> (and (= (P x) (P p11)) (= (P y) (P p12))) (= (R (P x)) (L (P y))))))
(assert (forall ((x Position) (y Position)) (=> (and (= (P x) (P p12)) (= (P y) (P p13))) (= (R (P x)) (L (P y))))))
(assert (forall ((x Position) (y Position)) (=> (and (= (P x) (P p21)) (= (P y) (P p22))) (= (R (P x)) (L (P y))))))
(assert (forall ((x Position) (y Position)) (=> (and (= (P x) (P p22)) (= (P y) (P p23))) (= (R (P x)) (L (P y))))))
(assert (forall ((x Position) (y Position)) (=> (and (= (P x) (P p31)) (= (P y) (P p32))) (= (R (P x)) (L (P y))))))
(assert (forall ((x Position) (y Position)) (=> (and (= (P x) (P p32)) (= (P y) (P p33))) (= (R (P x)) (L (P y))))))

(assert (forall ((x Position) (y Position)) (=> (and (= (P x) (P p11)) (= (P y) (P p21))) (= (B (P x)) (T (P y))))))
(assert (forall ((x Position) (y Position)) (=> (and (= (P x) (P p21)) (= (P y) (P p31))) (= (B (P x)) (T (P y))))))
(assert (forall ((x Position) (y Position)) (=> (and (= (P x) (P p12)) (= (P y) (P p22))) (= (B (P x)) (T (P y))))))
(assert (forall ((x Position) (y Position)) (=> (and (= (P x) (P p22)) (= (P y) (P p32))) (= (B (P x)) (T (P y))))))
(assert (forall ((x Position) (y Position)) (=> (and (= (P x) (P p13)) (= (P y) (P p23))) (= (B (P x)) (T (P y))))))
(assert (forall ((x Position) (y Position)) (=> (and (= (P x) (P p23)) (= (P y) (P p33))) (= (B (P x)) (T (P y))))))

(assert (= (T t1) 3))
(assert (= (L t1) 3))
(assert (= (B t1) 1))
(assert (= (R t1) 8))

(assert (= (T t2) 1))
(assert (= (L t2) 8))
(assert (= (B t2) 6))
(assert (= (R t2) 1))

(assert (= (T t3) 0))
(assert (= (L t3) 3))
(assert (= (B t3) 3))
(assert (= (R t3) 8))

(assert (= (T t4) 6))
(assert (= (L t4) 7))
(assert (= (B t4) 6))
(assert (= (R t4) 2))

(assert (= (T t5) 4))
(assert (= (L t5) 2))
(assert (= (B t5) 0))
(assert (= (R t5) 5))

(assert (= (T t6) 3))
(assert (= (L t6) 4))
(assert (= (B t6) 5))
(assert (= (R t6) 7))

(assert (= (T t7) 9))
(assert (= (L t7) 5))
(assert (= (B t7) 0))
(assert (= (R t7) 3))

(assert (= (T t8) 4))
(assert (= (L t8) 1))
(assert (= (B t8) 4))
(assert (= (R t8) 1))

(assert (= (T t9) 4))
(assert (= (L t9) 8))
(assert (= (B t9) 4))
(assert (= (R t9) 8))

(check-sat)
(get-value ((P p11) (P p12) (P p13) (P p21) (P p22) (P p23) (P p31) (P p32) (P p33)))


