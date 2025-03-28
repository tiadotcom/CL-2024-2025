; Antonio, Michele and Giovanni are members of the Italian Alpine Club (CAI). 
; Any member of the club who is not a skier is a climber. 
; Climbers do not like rain. 
; Any person who does not love snow is not a skier. 
; Antonio does not love what Michele loves. 
; Antonio loves rain and snow. 
; Is there a CAI member who is a skier but not a climber?

(declare-sort CAI)
(declare-const A CAI)
(declare-const M CAI)
(declare-const G CAI)
(declare-sort W) ; sort of the weather events
(declare-const s W) ; snow
(declare-const r W) ; rain
(declare-fun Skier (CAI) Bool)
(declare-fun Climber (CAI) Bool)
(declare-fun Likes (CAI W) Bool)


(assert (forall ((x CAI)) (=> (not (Skier x)) (Climber x)))) ; any member of the club who is not a skier is a climber
(assert (forall ((x CAI)) (=> (Climber x) (not (Likes x r))))) ; climbers do not like rain
(assert (forall ((x CAI)) (=> (not (Likes x s)) (not (Skier x))))) ; any person who does not love snow is not a skier
(assert (forall ((x W)) (=> (Likes M x) (not (Likes A x)))))
(assert (and (Likes A r) (Likes A s)))

(push)
; Negation of the assertion to be checked
(echo "Negation of the assertion to be checked")
(assert (forall ((x CAI)) (not (and (not (Climber x)) (Skier x)))))
(check-sat)
(echo "We got unsat so the assertion is true")
(echo " ")
; The exercise is solved, the query has a positive answer
; As an extra task, we want to know who is the person who is skier and not climber
(pop)

(push)
(echo "Let's get one model")
(check-sat)
(get-value ((and (not (Climber A)) (Skier A)) ))
(get-value ((and (not (Climber G)) (Skier G)) ))
(get-value ((and (not (Climber M)) (Skier M)) ))
(echo " ")
(pop)

(push)
; The above answer only says that there is a model where Antonio is climber but not skier; 
; Now we check that this happens in all models
(echo "Assertion: in all models Antonio is a climber but not a skier")
(assert (not (and (not (Climber A)) (Skier A))))
(check-sat)
(echo "We got unsat so the assertion is correct")
(echo " ")
(pop)

(push)
; However this is not the case for Giovanni
(echo "Assertion: in all models Giovanni is a climber but not a skier")
(assert (not (and (not (Climber G)) (Skier G))))
(check-sat)
(echo "We got sat so the assertion is not correct")
(echo " ")
(pop)