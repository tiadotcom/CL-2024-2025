; 1. No one brings flowers corresponding to their name.
; 2. No one receives flowers corresponding to her name.
; 3. No one gives flowers to the friend from whom she receives flowers.
; 4. Hortense gives Violet the flowers corresponding to the name of the friend who gives the violets to Daisy.
; 5. Hortense receives those corresponding to the name of the friend who gives hortenses to Rose.
; 6. Violet brings daisies. 

(declare-datatypes () ((P Hortense Violet Iris Rose Daisy)))
(declare-fun BringsFlowersTo (P P P) Bool) ; this predicate formalizes  "x gives y to z"

(assert (forall ((x P) (y P) (z P) (y1 P) (z1 P)) 
    (implies (and (BringsFlowersTo x y z) (BringsFlowersTo x y1 z1)) (and (= y y1) (= z z1)) )
)) 

(assert (forall ((x P) (x1 P) (y P) (y1 P) (z P)) 
    (implies (and (BringsFlowersTo x y z) (BringsFlowersTo x1 y1 z)) (= x x1))
)) 

(assert (forall ((x P) (x1 P) (y P) (z1 P) (z P)) 
    (implies (and (BringsFlowersTo x y z) (BringsFlowersTo x1 y z1)) (= x x1) )
)) 

(assert (forall ((x P)) 
    (exists ((y P) (z P)) 
        (BringsFlowersTo x y z) 
    )
)) 

(assert (forall ((x P) (y P))  
    (not (BringsFlowersTo x y x)) ; no one brings flower to herself
))

; 1. No one brings flowers corresponding to their name
(assert (forall ((x P) (y P)) (not (BringsFlowersTo x x y))))

; 2. No one receives flowers corresponding to her name
(assert (forall ((x P) (y P)) (not (BringsFlowersTo x y y))))

; 3. No one gives flowers to the friend from whom she receives flowers
(assert (forall ((x P) (y P) (y1 P) (z P)) (not (and (BringsFlowersTo x y z) (BringsFlowersTo z y1 x)))))

; 4. Hortense gives Violet the flowers corresponding to the name of the friend who gives the violets to Daisy
(assert (exists ((x P)) (and (BringsFlowersTo Hortense x Violet) (BringsFlowersTo x Violet Daisy))))

; 5. Hortense receives those corresponding to the name of the friend who gives hortenses to Rose
(assert (exists ((x P) (y P)) (and (BringsFlowersTo x y Hortense) (BringsFlowersTo y Hortense Rose))))

; 6. Violet brings daisies
(assert (exists ((x P)) (BringsFlowersTo Violet Daisy x)))

(declare-fun GivenFlowerBy (P) P) 
(declare-fun GivenPersonBy (P) P)
(assert (forall ((x P) (y P) (z P)) (= (BringsFlowersTo x y z) (and (= y (GivenFlowerBy x)) (= z (GivenPersonBy x))))))

(check-sat)
(get-value ((GivenFlowerBy Daisy) (GivenPersonBy Daisy)))



