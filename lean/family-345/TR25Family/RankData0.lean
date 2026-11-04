import TR25Family.Definitions

namespace TR25Family

def familyBasis0 (i j : Fin 50) : ℤ := if i = j then 1 else 0

def familyRows0 : Fin 50 → Coord 3 4 5 :=
  ![((0, 0), 0), ((0, 0), 1), ((0, 0), 2), ((0, 0), 3), ((0, 0), 4), ((0, 1), 0), ((0, 1), 1), ((0, 1), 2), ((0, 1), 3), ((0, 1), 4), ((0, 2), 0), ((0, 2), 1), ((0, 2), 2), ((0, 2), 3), ((0, 2), 4), ((0, 3), 0), ((0, 3), 3), ((0, 3), 4), ((1, 0), 0), ((1, 0), 1), ((1, 0), 2), ((1, 0), 3), ((1, 0), 4), ((1, 1), 0), ((1, 1), 1), ((1, 1), 2), ((1, 1), 3), ((1, 1), 4), ((1, 2), 0), ((1, 2), 1), ((1, 2), 2), ((1, 2), 3), ((1, 2), 4), ((1, 3), 1), ((2, 0), 0), ((2, 0), 1), ((2, 0), 2), ((2, 0), 3), ((2, 0), 4), ((2, 1), 0), ((2, 1), 1), ((2, 1), 2), ((2, 1), 3), ((2, 1), 4), ((2, 2), 0), ((2, 2), 1), ((2, 2), 2), ((2, 2), 3), ((2, 2), 4), ((2, 3), 2)]

def familySelected0 (R : Type*) [CommRing R] : Matrix (Fin 50) (Param 3 4 5) R :=
  (familyJacobian R 0).submatrix familyRows0 id

def familyInverse0Row00 (j : Fin 50) : ℤ :=
  (36) * familyBasis0 10 j

def familyInverse0Row01 (j : Fin 50) : ℤ :=
  (-90) * familyBasis0 18 j + (288) * familyBasis0 23 j + (-162) * familyBasis0 28 j + (90) * familyBasis0 34 j + (-144) * familyBasis0 39 j + (54) * familyBasis0 44 j

def familyInverse0Row02 (j : Fin 50) : ℤ :=
  (-108) * familyBasis0 18 j + (216) * familyBasis0 23 j + (-108) * familyBasis0 28 j + (108) * familyBasis0 34 j + (-108) * familyBasis0 39 j + (36) * familyBasis0 44 j

def familyInverse0Row03 (j : Fin 50) : ℤ :=
  (36) * familyBasis0 0 j + (-36) * familyBasis0 10 j + (-96) * familyBasis0 18 j + (192) * familyBasis0 23 j + (-96) * familyBasis0 28 j + (60) * familyBasis0 34 j + (-96) * familyBasis0 39 j + (36) * familyBasis0 44 j

def familyInverse0Row04 (j : Fin 50) : ℤ :=
  (36) * familyBasis0 5 j + (-36) * familyBasis0 10 j + (-15) * familyBasis0 18 j + (30) * familyBasis0 23 j + (-15) * familyBasis0 28 j + (15) * familyBasis0 34 j + (-24) * familyBasis0 39 j + (9) * familyBasis0 44 j

def familyInverse0Row05 (_j : Fin 50) : ℤ :=
  0

def familyInverse0Row06 (j : Fin 50) : ℤ :=
  (36) * familyBasis0 15 j

def familyInverse0Row07 (_j : Fin 50) : ℤ :=
  0

def familyInverse0Row08 (j : Fin 50) : ℤ :=
  (-54) * familyBasis0 1 j + (216) * familyBasis0 6 j + (-126) * familyBasis0 11 j + (54) * familyBasis0 35 j + (-54) * familyBasis0 40 j + (18) * familyBasis0 45 j

def familyInverse0Row09 (j : Fin 50) : ℤ :=
  (-162) * familyBasis0 2 j + (324) * familyBasis0 7 j + (-126) * familyBasis0 12 j + (162) * familyBasis0 20 j + (-162) * familyBasis0 25 j + (54) * familyBasis0 30 j

def familyInverse0Row10 (j : Fin 50) : ℤ :=
  (162) * familyBasis0 8 j + (-126) * familyBasis0 13 j + (-243) * familyBasis0 26 j + (162) * familyBasis0 31 j + (81) * familyBasis0 42 j + (-36) * familyBasis0 47 j

def familyInverse0Row11 (j : Fin 50) : ℤ :=
  (162) * familyBasis0 4 j + (-126) * familyBasis0 14 j + (-243) * familyBasis0 22 j + (81) * familyBasis0 32 j + (81) * familyBasis0 38 j + (-9) * familyBasis0 48 j

def familyInverse0Row12 (j : Fin 50) : ℤ :=
  (18) * familyBasis0 1 j + (-72) * familyBasis0 6 j + (54) * familyBasis0 11 j + (-18) * familyBasis0 35 j + (18) * familyBasis0 40 j + (-6) * familyBasis0 45 j

def familyInverse0Row13 (j : Fin 50) : ℤ :=
  (12) * familyBasis0 29 j

def familyInverse0Row14 (j : Fin 50) : ℤ :=
  (-108) * familyBasis0 1 j + (216) * familyBasis0 6 j + (-108) * familyBasis0 11 j + (108) * familyBasis0 35 j + (-54) * familyBasis0 40 j + (12) * familyBasis0 45 j

def familyInverse0Row15 (j : Fin 50) : ℤ :=
  (-72) * familyBasis0 1 j + (144) * familyBasis0 6 j + (-72) * familyBasis0 11 j + (36) * familyBasis0 19 j + (-12) * familyBasis0 29 j + (36) * familyBasis0 35 j + (-36) * familyBasis0 40 j + (12) * familyBasis0 45 j

def familyInverse0Row16 (j : Fin 50) : ℤ :=
  (-36) * familyBasis0 1 j + (72) * familyBasis0 6 j + (-36) * familyBasis0 11 j + (36) * familyBasis0 24 j + (-24) * familyBasis0 29 j + (36) * familyBasis0 35 j + (-36) * familyBasis0 40 j + (12) * familyBasis0 45 j

def familyInverse0Row17 (_j : Fin 50) : ℤ :=
  0

def familyInverse0Row18 (j : Fin 50) : ℤ :=
  (36) * familyBasis0 33 j

def familyInverse0Row19 (j : Fin 50) : ℤ :=
  (30) * familyBasis0 18 j + (-96) * familyBasis0 23 j + (66) * familyBasis0 28 j + (-30) * familyBasis0 34 j + (48) * familyBasis0 39 j + (-18) * familyBasis0 44 j

def familyInverse0Row20 (_j : Fin 50) : ℤ :=
  0

def familyInverse0Row21 (j : Fin 50) : ℤ :=
  (-270) * familyBasis0 2 j + (432) * familyBasis0 7 j + (-162) * familyBasis0 12 j + (270) * familyBasis0 20 j + (-216) * familyBasis0 25 j + (66) * familyBasis0 30 j

def familyInverse0Row22 (j : Fin 50) : ℤ :=
  (54) * familyBasis0 8 j + (-54) * familyBasis0 13 j + (-81) * familyBasis0 26 j + (66) * familyBasis0 31 j + (27) * familyBasis0 42 j + (-12) * familyBasis0 47 j

def familyInverse0Row23 (j : Fin 50) : ℤ :=
  (108) * familyBasis0 4 j + (-108) * familyBasis0 14 j + (-162) * familyBasis0 22 j + (66) * familyBasis0 32 j + (54) * familyBasis0 38 j + (-6) * familyBasis0 48 j

def familyInverse0Row24 (j : Fin 50) : ℤ :=
  (18) * familyBasis0 2 j + (-36) * familyBasis0 7 j + (18) * familyBasis0 12 j + (-18) * familyBasis0 20 j + (18) * familyBasis0 25 j + (-6) * familyBasis0 30 j

def familyInverse0Row25 (j : Fin 50) : ℤ :=
  (90) * familyBasis0 2 j + (-144) * familyBasis0 7 j + (54) * familyBasis0 12 j + (-90) * familyBasis0 20 j + (72) * familyBasis0 25 j + (-18) * familyBasis0 30 j

def familyInverse0Row26 (j : Fin 50) : ℤ :=
  (4) * familyBasis0 46 j

def familyInverse0Row27 (j : Fin 50) : ℤ :=
  (-180) * familyBasis0 2 j + (288) * familyBasis0 7 j + (-108) * familyBasis0 12 j + (144) * familyBasis0 20 j + (-144) * familyBasis0 25 j + (48) * familyBasis0 30 j + (36) * familyBasis0 36 j + (-4) * familyBasis0 46 j

def familyInverse0Row28 (j : Fin 50) : ℤ :=
  (-360) * familyBasis0 2 j + (576) * familyBasis0 7 j + (-216) * familyBasis0 12 j + (360) * familyBasis0 20 j + (-360) * familyBasis0 25 j + (120) * familyBasis0 30 j + (36) * familyBasis0 41 j + (-16) * familyBasis0 46 j

def familyInverse0Row29 (_j : Fin 50) : ℤ :=
  0

def familyInverse0Row30 (j : Fin 50) : ℤ :=
  (36) * familyBasis0 49 j

def familyInverse0Row31 (j : Fin 50) : ℤ :=
  (12) * familyBasis0 18 j + (-24) * familyBasis0 23 j + (12) * familyBasis0 28 j + (-12) * familyBasis0 34 j + (12) * familyBasis0 39 j

def familyInverse0Row32 (j : Fin 50) : ℤ :=
  (36) * familyBasis0 1 j + (-72) * familyBasis0 6 j + (36) * familyBasis0 11 j + (-36) * familyBasis0 35 j + (18) * familyBasis0 40 j

def familyInverse0Row33 (_j : Fin 50) : ℤ :=
  0

def familyInverse0Row34 (j : Fin 50) : ℤ :=
  (18) * familyBasis0 8 j + (-18) * familyBasis0 13 j + (-27) * familyBasis0 26 j + (18) * familyBasis0 31 j + (9) * familyBasis0 42 j

def familyInverse0Row35 (j : Fin 50) : ℤ :=
  (72) * familyBasis0 4 j + (-72) * familyBasis0 14 j + (-108) * familyBasis0 22 j + (36) * familyBasis0 32 j + (36) * familyBasis0 38 j

def familyInverse0Row36 (j : Fin 50) : ℤ :=
  (36) * familyBasis0 3 j + (-162) * familyBasis0 8 j + (126) * familyBasis0 13 j + (243) * familyBasis0 26 j + (-162) * familyBasis0 31 j + (-81) * familyBasis0 42 j + (36) * familyBasis0 47 j

def familyInverse0Row37 (j : Fin 50) : ℤ :=
  (-54) * familyBasis0 8 j + (54) * familyBasis0 13 j + (36) * familyBasis0 21 j + (81) * familyBasis0 26 j + (-66) * familyBasis0 31 j + (-27) * familyBasis0 42 j + (12) * familyBasis0 47 j

def familyInverse0Row38 (j : Fin 50) : ℤ :=
  (-18) * familyBasis0 8 j + (18) * familyBasis0 13 j + (27) * familyBasis0 26 j + (-18) * familyBasis0 31 j + (36) * familyBasis0 37 j + (-9) * familyBasis0 42 j

def familyInverse0Row39 (_j : Fin 50) : ℤ :=
  0

def familyInverse0Row40 (j : Fin 50) : ℤ :=
  (144) * familyBasis0 8 j + (-144) * familyBasis0 13 j + (-288) * familyBasis0 26 j + (192) * familyBasis0 31 j + (108) * familyBasis0 42 j + (-48) * familyBasis0 47 j

def familyInverse0Row41 (j : Fin 50) : ℤ :=
  (162) * familyBasis0 8 j + (-162) * familyBasis0 13 j + (-243) * familyBasis0 26 j + (162) * familyBasis0 31 j + (81) * familyBasis0 42 j + (-36) * familyBasis0 47 j

def familyInverse0Row42 (j : Fin 50) : ℤ :=
  (-36) * familyBasis0 16 j

def familyInverse0Row43 (j : Fin 50) : ℤ :=
  (-96) * familyBasis0 18 j + (192) * familyBasis0 23 j + (-96) * familyBasis0 28 j + (60) * familyBasis0 34 j + (-96) * familyBasis0 39 j + (36) * familyBasis0 44 j

def familyInverse0Row44 (j : Fin 50) : ℤ :=
  (-72) * familyBasis0 1 j + (144) * familyBasis0 6 j + (-72) * familyBasis0 11 j + (36) * familyBasis0 35 j + (-36) * familyBasis0 40 j + (12) * familyBasis0 45 j

def familyInverse0Row45 (j : Fin 50) : ℤ :=
  (-180) * familyBasis0 2 j + (288) * familyBasis0 7 j + (-108) * familyBasis0 12 j + (144) * familyBasis0 20 j + (-144) * familyBasis0 25 j + (48) * familyBasis0 30 j

def familyInverse0Row46 (_j : Fin 50) : ℤ :=
  0

def familyInverse0Row47 (j : Fin 50) : ℤ :=
  (144) * familyBasis0 4 j + (-144) * familyBasis0 14 j + (-288) * familyBasis0 22 j + (96) * familyBasis0 32 j + (108) * familyBasis0 38 j + (-12) * familyBasis0 48 j

def familyInverse0Row48 (j : Fin 50) : ℤ :=
  (-162) * familyBasis0 4 j + (36) * familyBasis0 9 j + (126) * familyBasis0 14 j + (243) * familyBasis0 22 j + (-81) * familyBasis0 32 j + (-81) * familyBasis0 38 j + (9) * familyBasis0 48 j

def familyInverse0Row49 (j : Fin 50) : ℤ :=
  (-216) * familyBasis0 4 j + (216) * familyBasis0 14 j + (324) * familyBasis0 22 j + (36) * familyBasis0 27 j + (-132) * familyBasis0 32 j + (-108) * familyBasis0 38 j + (12) * familyBasis0 48 j

def familyInverse0Row50 (j : Fin 50) : ℤ :=
  (-288) * familyBasis0 4 j + (288) * familyBasis0 14 j + (432) * familyBasis0 22 j + (-144) * familyBasis0 32 j + (-144) * familyBasis0 38 j + (36) * familyBasis0 43 j

def familyInverse0Row51 (j : Fin 50) : ℤ :=
  (-18) * familyBasis0 4 j + (18) * familyBasis0 14 j + (45) * familyBasis0 22 j + (-15) * familyBasis0 32 j + (-27) * familyBasis0 38 j + (3) * familyBasis0 48 j

def familyInverse0Row52 (_j : Fin 50) : ℤ :=
  0

def familyInverse0Row53 (j : Fin 50) : ℤ :=
  (162) * familyBasis0 4 j + (-162) * familyBasis0 14 j + (-243) * familyBasis0 22 j + (81) * familyBasis0 32 j + (81) * familyBasis0 38 j + (-9) * familyBasis0 48 j

def familyInverse0Row54 (j : Fin 50) : ℤ :=
  (-36) * familyBasis0 17 j

def familyInverse0Row55 (j : Fin 50) : ℤ :=
  (-15) * familyBasis0 18 j + (30) * familyBasis0 23 j + (-15) * familyBasis0 28 j + (15) * familyBasis0 34 j + (-24) * familyBasis0 39 j + (9) * familyBasis0 44 j

def familyInverse0Row56 (j : Fin 50) : ℤ :=
  (-18) * familyBasis0 1 j + (36) * familyBasis0 6 j + (-18) * familyBasis0 11 j + (18) * familyBasis0 35 j + (-18) * familyBasis0 40 j + (6) * familyBasis0 45 j

def familyInverse0Row57 (j : Fin 50) : ℤ :=
  (-90) * familyBasis0 2 j + (144) * familyBasis0 7 j + (-54) * familyBasis0 12 j + (90) * familyBasis0 20 j + (-90) * familyBasis0 25 j + (30) * familyBasis0 30 j

def familyInverse0Row58 (j : Fin 50) : ℤ :=
  (-18) * familyBasis0 8 j + (18) * familyBasis0 13 j + (45) * familyBasis0 26 j + (-30) * familyBasis0 31 j + (-27) * familyBasis0 42 j + (12) * familyBasis0 47 j

def familyInverse0Row59 (_j : Fin 50) : ℤ :=
  0

def familyInverse0 : Matrix (Param 3 4 5) (Fin 50) ℤ :=
  fun p => match p.2 with
  | Sum.inl i => ![![familyInverse0Row00, familyInverse0Row01, familyInverse0Row02], ![familyInverse0Row12, familyInverse0Row13, familyInverse0Row14], ![familyInverse0Row24, familyInverse0Row25, familyInverse0Row26], ![familyInverse0Row36, familyInverse0Row37, familyInverse0Row38], ![familyInverse0Row48, familyInverse0Row49, familyInverse0Row50]] p.1 i
  | Sum.inr (Sum.inl i) => ![![familyInverse0Row03, familyInverse0Row04, familyInverse0Row05, familyInverse0Row06], ![familyInverse0Row15, familyInverse0Row16, familyInverse0Row17, familyInverse0Row18], ![familyInverse0Row27, familyInverse0Row28, familyInverse0Row29, familyInverse0Row30], ![familyInverse0Row39, familyInverse0Row40, familyInverse0Row41, familyInverse0Row42], ![familyInverse0Row51, familyInverse0Row52, familyInverse0Row53, familyInverse0Row54]] p.1 i
  | Sum.inr (Sum.inr i) => ![![familyInverse0Row07, familyInverse0Row08, familyInverse0Row09, familyInverse0Row10, familyInverse0Row11], ![familyInverse0Row19, familyInverse0Row20, familyInverse0Row21, familyInverse0Row22, familyInverse0Row23], ![familyInverse0Row31, familyInverse0Row32, familyInverse0Row33, familyInverse0Row34, familyInverse0Row35], ![familyInverse0Row43, familyInverse0Row44, familyInverse0Row45, familyInverse0Row46, familyInverse0Row47], ![familyInverse0Row55, familyInverse0Row56, familyInverse0Row57, familyInverse0Row58, familyInverse0Row59]] p.1 i

end TR25Family
