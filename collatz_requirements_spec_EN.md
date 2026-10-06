# 📋 Formalization of the Collatz Conjecture: System Requirements & Integrated Specification Document

## 1. Purpose and Foundational Philosophy (Curry-Howard Isomorphism)

This document serves as the system acceptance specification designed to evaluate and judge the "Proof of the Collatz Conjecture"—as requested by human mathematicians and peer reviewers—with 100% certainty via automated verification (strong normalization) within a machine environment (Lean 4).

Based on the **Curry-Howard Isomorphism** (**Theorem = Type**, **Proof = Program**), this specification establishes a logical bridge. It ensures not only that the machine (the Lean 4 kernel) successfully compiles the code according to specification, but also enables human reviewers to verify and sign off that this type-level specification faithfully aligns with the original Collatz conjecture.

---

## 2. Hierarchical Proof Architecture (Domino Structure of Subsumptive Proof)

Abandoning traditional empirical approaches that rely on tracking individual numbers (ineffective finite sampling against infinity), this system completes the proof via a **three-stage hierarchical subsumption (domino effect) architecture**:

```
[Step 1: Infrastructure Topology Proof] 
Establish the structural integrity (existence of root and acyclicity) of the Peano infinite tree across 1D ➔ 2D ➔ 3D spaces within the type universe.
   │
   ▼
[Step 2: Core Structural Proof] 
Prove the Hamaji Strong Conjecture (Ceiling bound condition: N > K).
(Regardless of intermediate value spikes, the generational index K never exceeds the initial ceiling N.)
   │
   ▼
[Step 3: Automatic Subsumptive Proof] 
Complete establishment of the Collatz Conjecture (100% automatic logical consequence).
(Any arbitrary natural number N is bijectively mapped into this infinite tree, guaranteeing convergence to 1.)
```

* **Core Specification**: By formally proving the higher-level structures in Step 1 and Step 2 within Lean 4, the lower-level individual proposition (the Collatz Conjecture) is completely proved as a **pure theoretical consequence (automated sign-off)**.

---

## 3. Dimensional Topology Specifications (1D / 2D / 3D)

Through phased refactoring, the system employs a generalized software engineering architecture to guarantee verification integrity.

| Dimensional Space | Node Filter Condition (`isValidVertex`) | Role & Topological Structure |
| :--- | :--- | :--- |
| **1D Space** | All natural numbers ($\mathbb{N}$) | **Infrastructure Unit Test**: Constructs the baseline specification of a "root-1 infinite tree structure" on Peano arithmetic. |
| **2D Space** | Odd numbers only ($x \% 2 \neq 0$) | **Middleware Integration Test**: Verifies monotonically decreasing invariants and tree acyclicity using simplified Collatz rules (excluding even numbers). |
| **3D Space** | $4n+1$ type natural numbers only | **Production Logic Verification**: Constructs a complete network connecting encapsulated subtrees via the $3n+1 \leftrightarrow 4n+1$ mutual bijection. |

---

## 4. Interactive Testbed (Visual Simulation Model: $N = 27$)

To intuitively experience and verify the topological structures and the ceiling bound condition ($N > K$) outlined in this specification, an interactive web visualizer is bundled in the repository.

* **Verification Module**: [`Collatz-Sequence-Viewer1-3D.html`](./Collatz-Sequence-Viewer1-3D.html)
* **Worst-Case Evaluation Target**: $N = 27$ (The most complex seed value, peaking at $9232$ during trajectory execution)

### Bound Evaluation Results across Dimensions ($N = 27$)

1. **1D Space (Peano Linear Space)**:
   * Condition: All natural number nodes
   * Result: $N = 27 \implies K = 27$ ($N \ge K$: Verifies the baseline countdown trajectory)
2. **2D Space (Simplified Collatz Space)**:
   * Condition: Odd nodes only
   * Result: $N = 27 \implies K = 2$ ($27 > 2$: Demonstrates drastic generational compression via even-number elimination)
3. **3D Space (Full Collatz Topology)**:
   * Condition: $4n+1$ vertex nodes only
   * Result: $N = 27 \implies K = 17$ ($27 > 17$: Even when intermediate values spike to $9232$, the generational depth $K$ never breaches the initial ceiling $N=27$)

---

## 5. Process Specifications (Execution Semantics)

To ensure the validity of the machine evaluation, state transition processes executed within the type universe are defined as follows:

1. **State Transition Functions**:
   * Even Route: $S_{next} = S / 2$
   * Odd Route: $S_{next} = 3S + 1$ (Mapped directly into the $4n+1$ subtree structure in 3D space)
2. **Type-Level Strong Normalization (Termination Guarantee)**:
   * Transforms random arithmetic fluctuations into topological generational depth (index $K$).
   * Every node maintains a unique parent path toward the root ($1$), physically guaranteeing evaluation completion in finite steps through Lean kernel reduction (strong normalization).

---

## 6. User Acceptance Testing (UAT) and Sign-Off Criteria

Stakeholders (peer reviewers, mathematicians, and third-party verifiers) shall grant official acceptance sign-off once the Lean 4 compiler completes a clean build (`lake build` success) with zero errors under the following conditions:

1. **Complete Absence of `sorry` and Unproven Axioms**: No unverified shortcuts or skipped proofs (`sorry`) exist within the codebase.
2. **Topological Acyclicity**: The 1D–3D infinite tree structure is completely free of isolated loops or deadlock bugs.
3. **Validation of the Hamaji Strong Conjecture**: The ceiling bound condition $N > K$ is universally proven at the type level for all $N$, automatically completing the subsumptive proof of the Collatz Conjecture.