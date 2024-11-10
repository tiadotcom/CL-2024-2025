(define-fun xor3 ((x Bool) (y Bool) (z Bool)) Bool
	(and
		(or x y z)
		((_ at-most 1) x y z)
	)
)

(declare-const Belize1 Bool)
(declare-const Belize2 Bool)
(declare-const Belize3 Bool)
(assert (xor3 Belize1 Belize2 Belize3))

(declare-const Guatemala1 Bool)
(declare-const Guatemala2 Bool)
(declare-const Guatemala3 Bool)
(assert (xor3 Guatemala1 Guatemala2 Guatemala3))

(declare-const ElSalvador1 Bool)
(declare-const ElSalvador2 Bool)
(declare-const ElSalvador3 Bool)
(assert (xor3 ElSalvador1 ElSalvador2 ElSalvador3))

(declare-const Honduras1 Bool)
(declare-const Honduras2 Bool)
(declare-const Honduras3 Bool)
(assert (xor3 Honduras1 Honduras2 Honduras3))

(declare-const Nicaragua1 Bool)
(declare-const Nicaragua2 Bool)
(declare-const Nicaragua3 Bool)
(assert (xor3 Nicaragua1 Nicaragua2 Nicaragua3))

(declare-const CostaRica1 Bool)
(declare-const CostaRica2 Bool)
(declare-const CostaRica3 Bool)
(assert (xor3 CostaRica1 CostaRica2 CostaRica3))

(declare-const Panama1 Bool)
(declare-const Panama2 Bool)
(declare-const Panama3 Bool)
(assert (xor3 Panama1 Panama2 Panama3))

(assert (not (and Belize1 Guatemala1)))
(assert (not (and Belize2 Guatemala2)))
(assert (not (and Belize3 Guatemala3)))

(assert (not (and ElSalvador1 Guatemala1)))
(assert (not (and ElSalvador2 Guatemala2)))
(assert (not (and ElSalvador3 Guatemala3)))

(assert (not (and Honduras1 Guatemala1)))
(assert (not (and Honduras2 Guatemala2)))
(assert (not (and Honduras3 Guatemala3)))

(assert (not (and Honduras1 ElSalvador1)))
(assert (not (and Honduras2 ElSalvador2)))
(assert (not (and Honduras3 ElSalvador3)))

(assert (not (and Honduras1 Nicaragua1)))
(assert (not (and Honduras2 Nicaragua2)))
(assert (not (and Honduras3 Nicaragua3)))

(assert (not (and CostaRica1 Nicaragua1)))
(assert (not (and CostaRica2 Nicaragua2)))
(assert (not (and CostaRica3 Nicaragua3)))

(assert (not (and CostaRica1 Panama1)))
(assert (not (and CostaRica2 Panama2)))
(assert (not (and CostaRica3 Panama3)))

(check-sat)
(get-model)