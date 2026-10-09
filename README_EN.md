# Formal Verification of the Collatz Conjecture: Realizing the "Axiom of Real Process" via Type Universes

This repository contains the complete formal verification code (100% verified proof without `sorry`) for the **Collatz Conjecture**—a nearly 200-year-old unsolved problem in mathematics. It embodies a major paradigm shift in mathematical logic and theoretical computer science (TCS): **"The Evolution of Potential Infinity."**

The core paper presenting this methodology is currently **Under Review** at the **Theoretical Computer Science (TCS)** journal.

---

## 📋 Specifications & Requirements

* **[English] System Specification Document**: [`collatz_requirements_spec_ENG.md`](./collatz_requirements_spec_ENG.md)
* **[Japanese] Integrated System Specification**: [`collatz_requirements_spec_JPN.md`](./collatz_requirements_spec_JPN.md)
* **[Interactive Viewer] 3D Topology Visual Model**: [`Collatz-Sequence-Viewer1-3D.html`](./Collatz-Sequence-Viewer1-3D.html)

---

## 🌌 Core Philosophy: "The True Value of Evolution"

Traditional mathematics (ZFC set theory) abstracts dynamic infinite processes into static "sets," leaving human cognition trapped in the "brain simulation deadlock"—an inability to manually trace infinite runtime states.

This project removes that mathematical scotoma (psychological blind spot) by docking directly with the strict type-checking kernel (strong normalization) of the **Lean 4** theorem prover. By governing the wild chaos of the Collatz operation within the Type Universe, we evolve it into a physically verifiable **"Axiom of Real Process."**

> **【Cause】 Potential Infinity ＋ Strong Normalization (Machine Execution: Real Process)  
> ⇔ 【Result】 Countable Infinity ＋ Bijection (Mathematical Structure)**

The physical fact that `lean.exe` completes compilation without errors on a physical machine serves as 100% objective, hallucination-free proof of mathematical correctness.

---

## 🛠 Verification & Build Instructions

This codebase can be fully verified on standard commodity hardware without relying on massive corporate computational infrastructure.

### Prerequisites
- **Lean 4 Version:** `leanprover/lean4:v4.32.0`
- **Mathlib4 Version:** `v4.32.0`

### Build Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/Shinsuke-Hamaji/collatz-proof-lean4.git
   cd collatz-proof-lean4
   ```
2. Build and run the Lean 4 type-checker:
   ```bash
   lake build
   ```
*Note: Type-checking via strict strong normalization in `lean.exe` may take some time. Successful completion with zero errors constitutes physical proof of the theorem.*

---

## 🧬 Codebase Architecture (3-Step Proof Structure)

The main source file, `CollatzComplete.lean`, adheres to a three-tier mathematical architecture:

1. **`namespace CompleteCollatzTree` (Step 1: Connection to Infinite Tree Conditions)**  
   Constructs a "Peano Infinite Tree" extending Peano arithmetic. Connects topologically to Ramanujacharyulu's three conditions for infinite trees (existence of root, injectivity/branching, absence of cycles), establishing clean convergence without exceptional loops.
2. **`namespace MersenneOrder` (Step 3: Inversion of Chaos into Order)**  
   Implements a dynamics engine based on 2-adic integer ($\mathbb{Z}_{2}$) invariants: the "Mersenne Order." Formally verifies `reach_4n1_from_4n3`, proving that $4n+3$ shortcuts strictly decrease the Mersenne Order by 1, forcing all trajectories into an Order-1 orbit in finite steps.
3. **`namespace CollatzGeneration` (Step 2: Elimination of Hallucination & Ceiling Conditions)**  
   An evaluation function returning the "generation depth" of a node in the Collatz tree within the type universe. Universally verifies the Hamaji Strong Conjecture ($N > K$) in `generation_lt_value`, proving that the generation depth $K$ is strictly bounded by the seed value $N$.

---

## 📄 License & Credits

- **Author / Researcher:** Shinsuke Hamachi
- **Affiliation:** Hyama Natural Science Research Institute
- **License:** Apache License 2.0 / MIT (Matching Mathlib4 standards)

The authority of mathematical verification is restored from corporate black boxes to open-source computing and human cognition.