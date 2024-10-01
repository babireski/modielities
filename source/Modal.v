Inductive Intuitionistic : Set :=
    | Contradiction : Intuitionistic
    | Proposition   : Atom           -> Intuitionistic
    | Conjunction   : Intuitionistic -> Intuitionistic -> Intuitionistic
    | Disjunction   : Intuitionistic -> Intuitionistic -> Intuitionistic
    | Implication   : Intuitionistic -> Intuitionistic -> Intuitionistic.

Definition True              := Negation Contradiction.
Definition Negation α        := Implication (Proposition α) (Contradiction).
Definition Biimplication α β := Conjunction (Implication (Proposition α) (Proposition β)) (Implication (Proposition β) (Proposition α)).

Notation "# P"   := (Proposition P) (at level 1).
Notation "A ∨ B" := (Disjunction A B) (at level 15, right associativity).
Notation "A ∧ B" := (Conjunction A B) (at level 15, right associativity).
Notation "A → B" := (Implication A B) (at level 16, right associativity).
Notation "⊥"     := Contradiction (at level 0).
Notation "¬ A"   := (Negation A) (at level 5).
Notation "⊤"     := True (at level 0).
Notation "A ↔ B" := (Biimplication A B) (at level 17, right associativity).
