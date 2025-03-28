; A shepherd must ferry a wolf, a sheep, and a cabbage from one side of a river to the other. He may ferry a maximum of one of the three passengers at a time.
; He must not leave wolf and sheep, nor sheep and cabbage together without his supervision. 
; How should he do this? What is the minimum number of crossings he needs? 
; [Hint:See Example 36 p.92 of the Course Notes for some suggestions].

(declare-fun TRANSISTOR ((s Int) (wo Int) (sh Int) (ca Int) (sp Int) (wop Int) (shp Int) (cap Int)) Bool
    (and
    (
        ; the literal x = y asserts that x and y are on the same side of the river
        (=> (= wop shp) (= shp sp)) ; if the wolf is with the sheep, then also the sheperd is there
        (=> (= shp cap) (= shp sp)) ; if the sheep is with the cabbage, then also the sheperd is there
        (or
            (and (= s sp) (= wop wo) (= shp sh) (= cap ca)) ; no move
            (and (= wop (- 1 wo)) (= s wo) (= sp wop) (= shp sh) (= cap ca)) ; wolf moves
            (and (= shp (- 1 sh)) (= s sh) (= sp shp) (= wop wo) (= cap ca)) ; sheep moves
            (and (= cap (- 1 ca)) (= s ca) (= sp cap) (= wop wo) (= sh shp)) ; cabbage moves
            (and (= sp (- 1 s)) (= shp sh) (= wop wo) (= cap ca)) ; only sheperd moves
        )
    )
    )
)

(define-fun PRE ((s Int) (sh Int) (ca Int) (wo Int)) Bool (and (= s 0) (= sh 0) (= ca 0) (= wo 0)))
(define-fun POST ((s Int) (sh Int) (ca Int) (wo Int)) Bool (and (= s 1) (= sh 1) (= ca 1) (= wo 1)))

(declare-const s0 Int)
(declare-const sh0 Int)
(declare-const wo0 Int)
(declare-const ca0 Int)

(declare-const s1 Int)
(declare-const sh1 Int)
(declare-const wo1 Int)
(declare-const ca1 Int)

(assert (PRE s0 sh0 ca0 wo0))
(assert (TRANSISTOR s0 sh0 wo0 ca0 s1 sh1 wo1 ca1))
(assert (POST s1 sh1 ca1 wo1))

(check-sat)