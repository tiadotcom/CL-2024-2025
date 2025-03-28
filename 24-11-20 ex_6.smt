; Solve the ‘Einstein riddle’ (Example 35, page 90 of the course notes)

; On the same side of a street there are 5 houses with 5 different colors. 
; In each one lives a person of different nationality who drinks a different drink, smokes different cigarettes and has a different animal.
; But whose goldfish is it?


; To formalize the problem (which can be done in a variety of ways), it is useful to use enumerated data types
(declare-datatypes () ((H red white green blue yellow))) ; houses
(declare-datatypes () ((N english swede dane norwegian german))) ; nationalities
(declare-datatypes () ((D tea coffee milk beer water))) ; drinks
(declare-datatypes () ((C dunhills pallmall blends bluemasters prince))) ; cigarettes
(declare-datatypes () ((A dog bird cat horse goldfish))) ; animals

; Use function symbols to connect people with their pets, houses, cigarettes, and drinks
(declare-fun House (N H) Bool)
(declare-fun Drink (N D) Bool)
(declare-fun Cigarettes (N C) Bool)
(declare-fun Animal (N A) Bool)

(assert (House norwegian red)) ; 1. The Englishman lives in a red house
(assert (Animal swede dog)) ; 2. The Swede has a dog
(assert (Drink dane tea)) ;  3. The Dane drinks tea
(assert )

; funzione biettiva. funzione della funzione inversa ritorna all'inizio

