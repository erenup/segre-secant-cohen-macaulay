import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Data.Complex.Basic
import Mathlib.Tactic

namespace TR25Family

abbrev Coord (a b c : ℕ) := (Fin a × Fin b) × Fin c
abbrev Tensor (a b c : ℕ) (R : Type*) := Coord a b c → R

structure Factors (a b c : ℕ) where
  a : Fin 5 → Fin a → ℤ
  b : Fin 5 → Fin b → ℤ
  c : Fin 5 → Fin c → ℤ

/-- The two literal integer factor lists in certificate/witness.json. -/
def family : Fin 2 → Factors 3 4 5 :=
  ![{ a := ![![1, 0, 0], ![0, 1, 0], ![0, 0, 1], ![-1, -1, -1], ![-1, -2, -4]], b := ![![1, 1, 1, 0], ![1, 2, 3, 0], ![1, 4, 9, 0], ![1, 0, 0, 0], ![0, 1, 0, 0]], c := ![![1, 0, 0, 0, 0], ![0, 1, 0, 0, 0], ![0, 0, 1, 0, 0], ![0, 0, 0, 1, 0], ![0, 0, 0, 0, 1]] },
    { a := ![![1, 0, 0], ![0, 1, 0], ![0, 0, 1], ![-1, -1, -1], ![1, 3, 9]], b := ![![1, 1, 1, 0], ![1, 2, 3, 0], ![1, 4, 9, 0], ![1, 0, 0, 0], ![0, 0, 1, 0]], c := ![![1, 0, 0, 0, -1], ![0, 1, 0, 0, -1], ![0, 0, 1, 0, -1], ![0, 0, 0, 1, -1], ![0, 0, 0, 0, 1]] }]

def pure {a b c : ℕ} (R : Type*) [CommRing R]
    (f : Factors a b c) (t : Fin 5) : Tensor a b c R :=
  fun p => (f.a t p.1.1 : R) * (f.b t p.1.2 : R) * (f.c t p.2 : R)

def total {a b c : ℕ} (R : Type*) [CommRing R]
    (f : Factors a b c) : Tensor a b c R := ∑ t, pure R f t

/-- The six rank-one matrices from the row/column relation. -/
def q : Fin 6 → Matrix (Fin 3) (Fin 3) ℤ :=
  ![![![1,1,1], ![0,0,0], ![0,0,0]],
    ![![0,0,0], ![1,2,3], ![0,0,0]],
    ![![0,0,0], ![0,0,0], ![1,4,9]],
    ![![-1,0,0], ![-1,0,0], ![-1,0,0]],
    ![![0,-1,0], ![0,-2,0], ![0,-4,0]],
    ![![0,0,-1], ![0,0,-3], ![0,0,-9]]]

/-- The first five Q slices, with a zero fourth column in the B factor. -/
def witness : Tensor 3 4 5 ℤ := fun p =>
  if hj : p.1.2.val < 3 then
    q ⟨p.2.val, Nat.lt_trans p.2.isLt (by decide)⟩ p.1.1 ⟨p.1.2.val, hj⟩
  else 0

abbrev Param (a b c : ℕ) := Fin 5 × (Fin a ⊕ (Fin b ⊕ Fin c))

/-- Coordinate matrix of the linearized five-term tensor-sum map. -/
def jacobian {a b c : ℕ} (R : Type*) [CommRing R]
    (f : Factors a b c) : Matrix (Coord a b c) (Param a b c) R :=
  fun p t => match t.2 with
    | Sum.inl i => (if p.1.1 = i then 1 else 0) * (f.b t.1 p.1.2 : R) * (f.c t.1 p.2 : R)
    | Sum.inr (Sum.inl j) => (f.a t.1 p.1.1 : R) * (if p.1.2 = j then 1 else 0) * (f.c t.1 p.2 : R)
    | Sum.inr (Sum.inr k) => (f.a t.1 p.1.1 : R) * (f.b t.1 p.1.2 : R) * (if p.2 = k then 1 else 0)

def familyJacobian (R : Type*) [CommRing R] (d : Fin 2) := jacobian R (family d)

/-- The A flattening: rows are B,C coordinates; columns are A coordinates. -/
def flatteningA (R : Type*) [CommRing R] : Matrix (Fin 4 × Fin 5) (Fin 3) R :=
  fun jk i => (witness ((i,jk.1),jk.2) : R)

/-- The B flattening includes its identically zero fourth column. -/
def flatteningB (R : Type*) [CommRing R] : Matrix (Fin 3 × Fin 5) (Fin 4) R :=
  fun ik j => (witness ((ik.1,j),ik.2) : R)

def flatteningC (R : Type*) [CommRing R] : Matrix (Fin 3 × Fin 4) (Fin 5) R :=
  fun ij k => (witness (ij,k) : R)

def pairAB (R : Type*) [CommRing R] (d : Fin 2) : Matrix (Fin 3 × Fin 4) (Fin 5) R :=
  fun ij t => ((family d).a t ij.1 : R) * ((family d).b t ij.2 : R)

def pairAC (R : Type*) [CommRing R] (d : Fin 2) : Matrix (Fin 3 × Fin 5) (Fin 5) R :=
  fun ik t => ((family d).a t ik.1 : R) * ((family d).c t ik.2 : R)

def pairBC (R : Type*) [CommRing R] (d : Fin 2) : Matrix (Fin 4 × Fin 5) (Fin 5) R :=
  fun jk t => ((family d).b t jk.1 : R) * ((family d).c t jk.2 : R)

def thirdFactors (R : Type*) [CommRing R] (d : Fin 2) : Matrix (Fin 5) (Fin 5) R :=
  fun k t => ((family d).c t k : R)

def baseMatrix : Matrix (Fin 3) (Fin 3) ℚ := ![![1,1,1], ![1,2,3], ![1,4,9]]
def otherIndices : Fin 3 → Fin 2 → Fin 3 := ![![1,2], ![0,2], ![0,1]]
def rowRatio (i : Fin 3) : Matrix (Fin 3) (Fin 3) ℚ :=
  ![fun _ => 1, fun j => baseMatrix i j / baseMatrix (otherIndices i 0) j,
    fun j => baseMatrix i j / baseMatrix (otherIndices i 1) j]
def colRatio (j : Fin 3) : Matrix (Fin 3) (Fin 3) ℚ :=
  ![fun _ => 1, fun i => baseMatrix i j / baseMatrix i (otherIndices j 0),
    fun i => baseMatrix i j / baseMatrix i (otherIndices j 1)]

def NonzeroTerms {a b c : ℕ} (f : Factors a b c) : Prop :=
  ∀ t : Fin 5, pure ℂ f t ≠ 0

def DistinctDirections {a b c : ℕ} (f : Factors a b c) : Prop :=
  ∀ i j : Fin 5, i ≠ j → ∀ z : ℂ, pure ℂ f i ≠ z • pure ℂ f j

def DifferentDirections {a b c : ℕ} (f g : Factors a b c) : Prop :=
  ∃ i : Fin 5, ∀ j : Fin 5, ∀ z : ℂ, pure ℂ f i ≠ z • pure ℂ g j

end TR25Family
