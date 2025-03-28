; Write the solution file for the problem formalized in Example 34, p.89 of the Course Notes.

"
Let us consider the 'job shop scheduling' problem given by the following table:

        | Machine 1 | Machine 2 |
| Job 1 |     2     |     1     |
| Job 2 |     3     |     1     |
| Job 3 |     2     |     3     |

Find the way of executing all the jobs on all the machines in at most 8 time units. To this aim, it is sufficient to test satisfiability of the following formula. 
The six integer variables tij indicate the time at which the job i is executed on the machine j:

(t11 ≥ 0) ∧ (t12 ≥ t11 + 2) ∧ (t12 + 1 ≤ 8) ∧
(t21 ≥ 0) ∧ (t22 ≥ t21 + 3) ∧ (t22 + 1 ≤ 8) ∧
(t31 ≥ 0) ∧ (t32 ≥ t31 + 2) ∧ (t32 + 3 ≤ 8) ∧
((t11 ≥ t21 + 3) V (t21 ≥ t11 + 2)) ∧
((t11 ≥ t31 + 2) V (t31 ≥ t11 + 2)) ∧
((t21 ≥ t31 + 2) V (t31 ≥ t21 + 3)) ∧
((t12 ≥ t22 + 1) V (t22 ≥ t12 + 1)) ∧
((t12 ≥ t32 + 3) V (t32 ≥ t12 + 1)) ∧
((t22 ≥ t32 + 3) V (t32 ≥ t22 + 1)) ∧

Every job has to be executed first on Machine 1 and then on Machine 2
"

; Declare variables for starting times
(declare-const t11 Int)
(declare-const t12 Int)
(declare-const t21 Int)
(declare-const t22 Int)
(declare-const t31 Int)
(declare-const t32 Int)

; Ensure non-negative start times
(assert (>= t11 0))
(assert (>= t21 0))
(assert (>= t31 0))

; Timing constraints for each job on both machines
(assert (and (>= t12 (+ t11 2)) (<= (+ t12 1) 8))) ; job 1
(assert (and (>= t22 (+ t21 3)) (<= (+ t22 1) 8))) ; job 2
(assert (and (>= t32 (+ t31 2)) (<= (+ t32 3) 8))) ; job 3

; Machine 1 ordering constraints
(assert (or (>= t11 (+ t21 3)) (>= t21 (+ t11 2))))
(assert (or (>= t11 (+ t31 2)) (>= t31 (+ t11 2))))
(assert (or (>= t21 (+ t31 2)) (>= t31 (+ t21 3))))

; Machine 2 ordering constraints
(assert (or (>= t12 (+ t22 1)) (>= t22 (+ t12 1))))
(assert (or (>= t12 (+ t32 3)) (>= t32 (+ t12 1))))
(assert (or (>= t22 (+ t32 3)) (>= t32 (+ t22 1))))

(check-sat)
(get-value (t11 t12 t21 t22 t31 t32))


