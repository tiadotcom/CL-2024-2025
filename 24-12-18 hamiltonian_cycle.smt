; Find a Hamiltonian cycle in the following graph 
; a----b
; |\  /
; | \/  
; | /\
; |/  \
; c----d

; We first insert tha data of the graph
(declare-datatypes () ((G a b c d))) ; G is the sort of all the nodes of the graph
(declare-fun R (G G) Bool) ; function of the edges
(assert (forall ((x G) (y G)) 
             (= 
                (R x y) ; this relation holds only in the following cases
                (or 
                    (and (= x a) (= y b))
                    (and (= x a) (= y c))
                    (and (= x b) (= y c))
                    (and (= x a) (= y d))
                    (and (= x c) (= y d))                  
                )
              )
        )
)

; This constant indicates the initial and terminal node of the cycle 
(declare-const I G)

; The problem variables are two: 
;   1) the current node p
;   2) an array V of Booleans indicating the already visited nodes

; Initially p = I and no node is visited
(define-fun PRE ((p G) (V (Array G Bool))) Bool ; V stands for "visited" 
     (and 
      (= p I) ; at the beginning the position is I
      (forall ((x G)) (not (select V x))) ; (select V x) is not True
     )
)

; At the end of the cycle p = I and all nodes are visited
(define-fun POST ((p G) (V (Array G Bool))) Bool 
     (and 
      (= p I) ; since we want a cycle, the final position is I
      (forall ((x G)) (select V x)) ; (select V x) is True, i.e. all nodes are visited
     )
)

; The transition moves the current node from p to pp; pp was not visited in V and is marked as visited in Vp
(define-fun TRANS ((p G) (V (Array G Bool)) (pp G) (Vp (Array G Bool))) Bool 
    (and 
        (not (V pp))
        (or (R p pp) (R pp p))
        (= Vp (store V pp true)) ; the next array is the old one where the newly visited point is True. Remember that store modifies only one entry
    )
)

; The number of transitions is equal to the number of the nodes
(declare-const p0 G)
(declare-const V0 (Array G Bool))

(declare-const p1 G)
(declare-const V1 (Array G Bool))

(declare-const p2 G)
(declare-const V2 (Array G Bool))

(declare-const p3 G)
(declare-const V3 (Array G Bool))

(declare-const p4 G)
(declare-const V4 (Array G Bool))

(assert (PRE p0 V0 ) )
(assert (TRANS p0 V0 p1 V1 ) )
(assert (TRANS p1 V1 p2 V2 ) )
(assert (TRANS p2 V2 p3 V3 ) )
(assert (TRANS p3 V3 p4 V4 ) )
(assert (POST p4 V4 ) )

(check-sat)

(get-value (p0 p1 p2 p3 p4))

