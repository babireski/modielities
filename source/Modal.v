Inductive Intuitionistic : Set :=
    | Proposition : nat -> Intuitionistic
    | Negation    : Intuitionistic -> Intuitionistic
    | Conjunction : Intuitionistic -> Intuitionistic -> Intuitionistic
    | Disjunction : Intuitionistic -> Intuitionistic -> Intuitionistic
    | Implication : Intuitionistic -> Intuitionistic -> Intuitionistic.

Inductive Modal : Set :=
    | Lit     : nat -> Modal
    | Neg     : Modal -> Modal
    | Box     : Modal -> Modal
    | Dia     : Modal -> Modal
    | And     : Modal -> Modal -> Modal
    | Or      : Modal -> Modal -> Modal
    | Implies : Modal -> Modal -> Modal.

Fixpoint boxtranslation (φ : Intuitionistic) : Modal :=
    match φ with
    | Proposition a   => Box (Lit a)
    | Negation    φ   => Box (Neg (boxtranslation φ))
    | Disjunction φ ψ => And (boxtranslation φ) (boxtranslation ψ)
    | Conjunction φ ψ => Or  (boxtranslation φ) (boxtranslation ψ)
    | Implication φ ψ => Box (Implies (boxtranslation φ) (boxtranslation ψ))
    end.



(* □ *)
(* ◇ *)

