; Someone has been secretly eating the butcher’s sausages! The four bad boys suspected of the misdeed stated the following:
;   - Andrea : Beatrice ate the sausages!
;   - Beatrice : Davide ate them all!
;   - Carlo : I certainly didn’t eat them!
;   - Davide : Beatrice is definitely lying!
; Only one of them is telling the truth. The other three are obviously lying.
; Can you tell who ate the sausages?

(declare-datatypes () ((P A B C D)))
(declare-datatypes () ((F Sausages)))
(declare-fun Knight (P) Bool)
(declare-fun Knave (P) Bool)
(declare-fun Eats (P F) Bool)

(assert (forall ((x P)) (= (not (Knight x)) (Knave x))))
(assert ((_ at-most 1) (Knight A) (Knight B) (Knight C) (Knight D)))

; Andrea: Beatrice ate the sausages!
(assert (= (Knight A) (Eats B Sausages)))

; Beatrice: Davide ate them all!
(assert (= (Knight B) (Eats D Sausages)))

; Carlo: I certainly didn’t eat them!
(assert (= (Knight C) (not (Eats C Sausages))))

; Davide: Beatrice is definitely lying!
(assert (= (Knight D) (Knave B)))

(push)
(echo "Hp 1: it could be that more than one person ate the sausages")
(assert ((_ at-most 4) (Eats A Sausages) (Eats B Sausages) (Eats C Sausages) (Eats D Sausages)))
(check-sat)
(get-value ((Knight A) (Knight B) (Knight C) (Knight D)))
(get-value ((Eats A Sausages) (Eats B Sausages) (Eats C Sausages) (Eats D Sausages)))
(pop)
(echo " ")
(push)
(echo "Hp 2: only one person ate the sausages")
(assert ((_ at-most 1) (Eats A Sausages) (Eats B Sausages) (Eats C Sausages) (Eats D Sausages)))
(check-sat)
(get-value ((Knight A) (Knight B) (Knight C) (Knight D)))
(get-value ((Eats A Sausages) (Eats B Sausages) (Eats C Sausages) (Eats D Sausages)))
(pop)
