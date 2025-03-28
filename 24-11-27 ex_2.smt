; Our Italian region Lombardia has 12 provinces: Varese (Va), Lecco (Le), Como (Co), Sondrio (So), 
; Monza-Brianza (MB), Milano (Mi), Bergamo (Be), Brescia (Br), Pavia (Pa), Lodi (Lo), Cremona (Cr), Mantova (Ma). 
; The border relations are: (Va-Co), (Va-Mi), (Va-MB), (Co-Le), (Co-So), (Co-MB), (Le-So), (Le-Be), (Le-MB),
; (So-Be), (So-Br), (MB-Be), (MB-Mi), (Be-Br), (Be-Cr), (Be-Mi), (Br-Cr), (Br-Ma), (Mi-Pa), (Mi-Lo), (Mi-Cr),
; (Pa-Lo), (Lo-Cr), (Cr-Ma). 
; Find the minimum number of colors needed to color this geographic map.

(declare-datatypes () ((P Va Le Co So MB Mi Be Br Pa Lo Cr Ma)))
(declare-fun Color (P) Int)
(declare-fun Border (P P) Bool)

(assert (forall ((x P) (y P)) (=> (Border x y) (not (= (Color x) (Color y))))))

(assert (and
            (Border Va Co) (Border Va Mi) (Border Va MB) (Border Co Le) (Border Co So) (Border Co MB) (Border Le So) (Border Pa Lo)
            (Border Le Be) (Border Le MB) (Border So Be) (Border So Br) (Border MB Be) (Border MB Mi) (Border Be Br) (Border Lo Cr)
            (Border Be Cr) (Border Be Mi) (Border Br Cr) (Border Br Ma) (Border Mi Pa) (Border Mi Lo) (Border Mi Cr) (Border Cr Ma)
        )
)

(push)
(assert (forall ((x P)) (and (<= 1 (Color x)) (<= (Color x) 3))))
(check-sat)
(pop)
(push)
(assert (forall ((x P)) (and (<= 1 (Color x)) (<= (Color x) 4))))
(check-sat)
(pop)
