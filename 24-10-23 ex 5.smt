(define-fun xor3 ((x Bool) (y Bool) (z Bool)) Bool
	(and
		(or x y z)
		((_ at-most 1) x y z)
	)
)

; Colombia
(declare-const Co1 Bool)
(declare-const Co2 Bool)
(declare-const Co3 Bool)
(assert (xor3 Co1 Co2 Co3))

; Venezuela
(declare-const Ve1 Bool)
(declare-const Ve2 Bool)
(declare-const Ve3 Bool)
(assert (xor3 Ve1 Ve2 Ve3))

; Ecuador
(declare-const Ec1 Bool)
(declare-const Ec2 Bool)
(declare-const Ec3 Bool)
(assert (xor3 Ec1 Ec2 Ec3))

; Guyana
(declare-const Gu1 Bool)
(declare-const Gu2 Bool)
(declare-const Gu3 Bool)
(assert (xor3 Gu1 Gu2 Gu3))

; Suriname
(declare-const Su1 Bool)
(declare-const Su2 Bool)
(declare-const Su3 Bool)
(assert (xor3 Su1 Su2 Su3))

; French Guiana
(declare-const Fr1 Bool)
(declare-const Fr2 Bool)
(declare-const Fr3 Bool)
(assert (xor3 Fr1 Fr2 Fr3))

; Peru
(declare-const Pe1 Bool)
(declare-const Pe2 Bool)
(declare-const Pe3 Bool)
(assert (xor3 Pe1 Pe2 Pe3))

; Bolivia
(declare-const Bo1 Bool)
(declare-const Bo2 Bool)
(declare-const Bo3 Bool)
(assert (xor3 Bo1 Bo2 Bo3))

; Brazil
(declare-const Br1 Bool)
(declare-const Br2 Bool)
(declare-const Br3 Bool)
(assert (xor3 Br1 Br2 Br3))

; Paraguay
(declare-const Pa1 Bool)
(declare-const Pa2 Bool)
(declare-const Pa3 Bool)
(assert (xor3 Pa1 Pa2 Pa3))

; Chile
(declare-const Ch1 Bool)
(declare-const Ch2 Bool)
(declare-const Ch3 Bool)
(assert (xor3 Ch1 Ch2 Ch3))

; Argentina
(declare-const Ar1 Bool)
(declare-const Ar2 Bool)
(declare-const Ar3 Bool)
(assert (xor3 Ar1 Ar2 Ar3))

; Uruguay
(declare-const Ur1 Bool)
(declare-const Ur2 Bool)
(declare-const Ur3 Bool)
(assert (xor3 Ur1 Ur2 Ur3))

; Borders

(assert (not (and Ec1 Co1)))
(assert (not (and Ec2 Co2)))
(assert (not (and Ec3 Co3)))

(assert (not (and Ec1 Pe1)))
(assert (not (and Ec2 Pe2)))
(assert (not (and Ec3 Pe3)))

(assert (not (and Co1 Ve1)))
(assert (not (and Co2 Ve2)))
(assert (not (and Co3 Ve3)))

(assert (not (and Co1 Pe1)))
(assert (not (and Co2 Pe2)))
(assert (not (and Co3 Pe3)))

(assert (not (and Co1 Br1)))
(assert (not (and Co2 Br2)))
(assert (not (and Co3 Br3)))

(assert (not (and Ve1 Gu1)))
(assert (not (and Ve2 Gu2)))
(assert (not (and Ve3 Gu3)))

(assert (not (and Ve1 Br1)))
(assert (not (and Ve2 Br2)))
(assert (not (and Ve3 Br3)))

(assert (not (and Gu1 Br1)))
(assert (not (and Gu2 Br2)))
(assert (not (and Gu3 Br3)))

(assert (not (and Gu1 Su1)))
(assert (not (and Gu2 Su2)))
(assert (not (and Gu3 Su3)))

(assert (not (and Br1 Su1)))
(assert (not (and Br2 Su2)))
(assert (not (and Br3 Su3)))

(assert (not (and Su1 Fr1)))
(assert (not (and Su2 Fr2)))
(assert (not (and Su3 Fr3)))

(assert (not (and Br1 Fr1)))
(assert (not (and Br2 Fr2)))
(assert (not (and Br3 Fr3)))

(assert (not (and Br1 Pe1)))
(assert (not (and Br2 Pe2)))
(assert (not (and Br3 Pe3)))

(assert (not (and Pe1 Bo1)))
(assert (not (and Pe2 Bo2)))
(assert (not (and Pe3 Bo3)))

(assert (not (and Pe1 Ch1)))
(assert (not (and Pe2 Ch2)))
(assert (not (and Pe3 Ch3)))

(assert (not (and Bo1 Br1)))
(assert (not (and Bo2 Br2)))
(assert (not (and Bo3 Br3)))

(assert (not (and Bo1 Ar1)))
(assert (not (and Bo2 Ar2)))
(assert (not (and Bo3 Ar3)))

(assert (not (and Bo1 Pa1)))
(assert (not (and Bo2 Pa2)))
(assert (not (and Bo3 Pa3)))

(assert (not (and Br1 Pa1)))
(assert (not (and Br2 Pa2)))
(assert (not (and Br3 Pa3)))

(assert (not (and Pa1 Ar1)))
(assert (not (and Pa2 Ar2)))
(assert (not (and Pa3 Ar3)))

(assert (not (and Ch1 Ar1)))
(assert (not (and Ch2 Ar2)))
(assert (not (and Ch3 Ar3)))

(assert (not (and Br1 Ar1)))
(assert (not (and Br2 Ar2)))
(assert (not (and Br3 Ar3)))

(assert (not (and Br1 Ur1)))
(assert (not (and Br2 Ur2)))
(assert (not (and Br3 Ur3)))

(assert (not (and Ar1 Ur1)))
(assert (not (and Ar2 Ur2)))
(assert (not (and Ar3 Ur3)))

(check-sat)











