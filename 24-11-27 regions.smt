; How many colors are needed to color the Central Italy Regions Map? Are three colors sufficient? 
; Recall that the Central Italy Regions are: Emilia-Romagna, Toscana, Umbria, Lazio, Marche, Abruzzo, Molise. 
; The border relations are as follows: 
; Emilia-Toscana, Emilia-Marche, Umbria-Lazio, Umbria-Tuscana, Umbria-Marche, Toscana-Marche, 
; Toscana-Lazio, Marche-Abruzzo, Marche-Lazio, Abruzzo-Lazio, Abruzzo-Molise, Lazio-Molise.




(declare-datatypes () ((Regions T E Ma U L A Mo)))

(declare-fun Color (Regions) Int) ; this function goes from color to int. For every region x, Color(x) is an integer
(declare-fun Border (Regions Regions) Bool) ; this is a binary relation

(assert (forall ((x Regions) (y Regions)) (=> (Border x y) (not (= (Color x) (Color y)))))) ; if two regions share a border, they have different colors

(assert (and 
        (Border E T) (Border E Ma) (Border U L) (Border U T) (Border U Ma) (Border T Ma)  
        (Border T L) (Border Ma A) (Border Ma L) (Border A L) (Border A Mo) (Border L Mo)
        )
) ; specifies the borders
        


(push)
(assert (forall ((x Regions)) (and (<= 1 (Color x)) (<= (Color x) 3)))) ; in one shot we have declared that every region has a color and that we have 3 colors
(check-sat)
(pop)
(push)
(assert (forall ((x Regions)) (and (<= 1 (Color x)) (<= (Color x) 4)))) ; in this case we are using 4 colors
(check-sat)
(echo " ")
(echo "Toscana")
(get-value ((Color T)))
(echo "Emilia-Romagna")
(get-value ((Color E)))
(echo "Marche")
(get-value ((Color Ma)))
(echo "Umbria")
(get-value ((Color U)))
(echo "Lazio")
(get-value ((Color L)))
(echo "Abruzzo")
(get-value ((Color A)))
(echo "Molise")
(get-value ((Color Mo)))
(pop)
