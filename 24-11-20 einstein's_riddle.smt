(declare-datatypes () ((House A B C D E)))

(declare-fun ToLeft (House House) Bool)
(declare-fun ToRight (House House) Bool)

(define-fun Neighbor ((a House) (b House)) Bool 
    (or 
    (ToLeft a b) 
    (ToRight a b)
    )
) ; two houses are neighbors if one is immediately to the left or right of the other

(assert (forall ((a House) (b House)) (= (ToLeft a b) (ToRight b a)))) ; if one house is to the left of another, then the reverse is also true

(assert (ToLeft A B)) ; house A is immediately to the left of house B
(assert (ToLeft B C))
(assert (ToLeft C D))
(assert (ToLeft D E))
(assert (forall ((x House)) (not (ToLeft x A)))) ; A is a boundary house
(assert (forall ((x House)) (=> (ToRight x A) (= x B)))) 
(assert (forall ((x House)) (=> (ToRight x B) (= x C))))
(assert (forall ((x House)) (=> (ToRight x C) (= x D))))
(assert (forall ((x House)) (=> (ToRight x D) (= x E)))) 
(assert (forall ((x House)) (not (ToRight x E)))) ; E is a boundary house 

(declare-datatypes () ((Animal Dog Horse Cat Fish Bird)))
(declare-datatypes () ((Drink Water Beer Coffee Milk Tea)))
(declare-datatypes () ((Color White Blue Yellow Red Green)))
(declare-datatypes () ((Nationality Dane English Norwegian Swedish German)))
(declare-datatypes () ((Cigarettes Blends BlueMaster Dunhill PallMall Prince)))

(declare-fun HasAnimal (House) Animal)
(declare-fun HasDrink (House) Drink)
(declare-fun HasColor (House) Color)
(declare-fun HasNationality (House) Nationality)
(declare-fun HasCigarettes (House) Cigarettes)

; Different houses have different colors, nationalities, drinks, cigarettes, and animals
(assert (distinct (HasAnimal A) (HasAnimal B) (HasAnimal C) (HasAnimal D) (HasAnimal E)))
(assert (distinct (HasDrink A) (HasDrink B) (HasDrink C) (HasDrink D) (HasDrink E)))
(assert (distinct (HasColor A) (HasColor B) (HasColor C) (HasColor D) (HasColor E)))
(assert (distinct (HasNationality A) (HasNationality B) (HasNationality C) (HasNationality D) (HasNationality E)))
(assert (distinct (HasCigarettes A) (HasCigarettes B) (HasCigarettes C) (HasCigarettes D) (HasCigarettes E)))

; Clues

; The Englishman lives in a red house
(assert (forall ((x House)) (=> (= (HasNationality x) English) (= (HasColor x) Red))))

; The Swede has a dog
(assert (forall ((x House)) (=> (= (HasNationality x) Swedish) (= (HasAnimal x) Dog))))

; The Dane drinks tea
(assert (forall ((x House)) (=> (= (HasNationality x) Dane) (= (HasDrink x) Tea))))

; The green house is to the left of the white one
(assert (forall ((x House))
                (=> 
                (= (HasColor x) White) 
                (forall ((y House)) (=> (= (HasColor y) Green) (ToLeft y x)))
                )
        )
)

; The master of the green house drinks coffee
(assert (forall ((x House)) (=> (= (HasColor x) Green) (= (HasDrink x) Coffee))))

; The person who smokes Pall Mall has little birds
(assert (forall ((x House)) (=> (= (HasCigarettes x) PallMall) (= (HasAnimal x) Bird))))

; The owner of the yellow house smokes Dunhills
(assert (forall ((x House)) (=> (= (HasColor x) Yellow) (= (HasCigarettes x) Dunhill))))

; The man in the middle house drinks milk
(assert (= (HasDrink C) Milk))

; The Norwegian man lives in the first house    
(assert (= (HasNationality A) Norwegian))

; The man who smokes Blends lives next to the man who has cats
(assert (forall ((x House))
                (=> 
                (= (HasCigarettes x) Blends)
                (forall ((y House)) (=> (= (HasAnimal y) Cat) (Neighbor y x)))
                )
        )
)

; The man who has horses is next to the man who smokes Dunhills
(assert (forall ((x House))
                (=> 
                (= (HasAnimal x) Horse)
                (forall ((y House)) (=> (= (HasCigarettes y) Dunhill) (Neighbor y x)))
                )
        )
)

; The man who smokes Blue Masters drinks beer
(assert (forall ((x House)) (=> (= (HasCigarettes x) BlueMaster) (= (HasDrink x) Beer))))

; The German man smokes Prince
(assert (forall ((x House)) (=> (= (HasNationality x) German) (= (HasCigarettes x) Prince))))

; The Norwegian man lives near the blue house
(assert (forall ((x House))
                (=> 
                (= (HasNationality x) Norwegian)
                (forall ((y House)) (=> (= (HasColor y) Blue) (Neighbor y x)))
                )
        )
)

; The man who smokes Blends has a neighbor who drinks water
(assert (forall ((x House))
                (=> 
                (= (HasCigarettes x) Blends)
                (forall ((y House)) (=> (= (HasDrink y) Water) (Neighbor y x)))
                )
        )
)

; Test for uniqueness of solution: tests if the solution is unique by asserting the negation of the expected answer
(push) 
(assert (not (forall ((x House)) (=> (= (HasNationality x) German) (= (HasAnimal x) Fish)))))
(check-sat) ; here we want to get unsat
(pop)

(check-sat) ; here we want to get sat
(get-model)
(echo " ")
(echo "The German has the fish.")
(echo " ")
(echo "House A")
(eval (HasColor A))
(eval (HasNationality A))
(eval (HasDrink A))
(eval (HasCigarettes A))
(eval (HasAnimal A))
(echo " ")
(echo "House B")
(eval (HasColor B))
(eval (HasNationality B))
(eval (HasDrink B))
(eval (HasCigarettes B))
(eval (HasAnimal B))
(echo " ")
(echo "House C")
(eval (HasColor C))
(eval (HasNationality C))
(eval (HasDrink C))
(eval (HasCigarettes C))
(eval (HasAnimal C))
(echo " ")
(echo "House D")
(eval (HasColor D))
(eval (HasNationality D))
(eval (HasDrink D))
(eval (HasCigarettes D))
(eval (HasAnimal D))
(echo " ")
(echo "House E")
(eval (HasColor E))
(eval (HasNationality E))
(eval (HasDrink E))
(eval (HasCigarettes E))
(eval (HasAnimal E))
