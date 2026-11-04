import TR25.Definitions

namespace TR25

def largeBasis0 (i j : Fin 80) : ℤ := if i = j then 1 else 0

def largeRows0 : Fin 80 → Coord 6 6 6 :=
  ![((0, 0), 0), ((0, 0), 1), ((0, 0), 2), ((0, 0), 3), ((0, 0), 4), ((0, 0), 5), ((0, 1), 0), ((0, 1), 1), ((0, 1), 2), ((0, 1), 3), ((0, 1), 4), ((0, 1), 5), ((0, 2), 0), ((0, 2), 1), ((0, 2), 2), ((0, 2), 3), ((0, 2), 4), ((0, 2), 5), ((0, 3), 0), ((0, 3), 3), ((0, 3), 4), ((0, 4), 0), ((0, 4), 3), ((0, 4), 4), ((0, 5), 0), ((0, 5), 3), ((0, 5), 4), ((1, 0), 0), ((1, 0), 1), ((1, 0), 2), ((1, 0), 3), ((1, 0), 4), ((1, 0), 5), ((1, 1), 0), ((1, 1), 1), ((1, 1), 2), ((1, 1), 3), ((1, 1), 4), ((1, 2), 0), ((1, 2), 1), ((1, 2), 2), ((1, 2), 3), ((1, 2), 4), ((1, 3), 1), ((1, 4), 1), ((1, 5), 1), ((2, 0), 0), ((2, 0), 1), ((2, 0), 2), ((2, 0), 3), ((2, 0), 4), ((2, 0), 5), ((2, 1), 0), ((2, 1), 1), ((2, 1), 2), ((2, 1), 3), ((2, 1), 4), ((2, 2), 0), ((2, 2), 1), ((2, 2), 2), ((2, 2), 3), ((2, 2), 4), ((2, 3), 2), ((2, 4), 2), ((2, 5), 2), ((3, 0), 0), ((3, 0), 1), ((3, 0), 2), ((3, 0), 3), ((3, 1), 4), ((4, 0), 0), ((4, 0), 1), ((4, 0), 2), ((4, 0), 3), ((4, 1), 4), ((5, 0), 0), ((5, 0), 1), ((5, 0), 2), ((5, 0), 3), ((5, 1), 4)]

def largeSelected0 (R : Type*) [CommRing R] : Matrix (Fin 80) (Param 6 6 6) R :=
  (embeddedJacobian R 0).submatrix largeRows0 id

def largeInverse0Row00 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 12 j

def largeInverse0Row01 (j : Fin 80) : ℤ :=
  (-90) * largeBasis0 27 j + (288) * largeBasis0 33 j + (-162) * largeBasis0 38 j + (90) * largeBasis0 46 j + (-144) * largeBasis0 52 j + (54) * largeBasis0 57 j

def largeInverse0Row02 (j : Fin 80) : ℤ :=
  (-108) * largeBasis0 27 j + (216) * largeBasis0 33 j + (-108) * largeBasis0 38 j + (108) * largeBasis0 46 j + (-108) * largeBasis0 52 j + (36) * largeBasis0 57 j

def largeInverse0Row03 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 65 j

def largeInverse0Row04 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 70 j

def largeInverse0Row05 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 75 j

def largeInverse0Row06 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 0 j + (-36) * largeBasis0 12 j + (-96) * largeBasis0 27 j + (192) * largeBasis0 33 j + (-96) * largeBasis0 38 j + (60) * largeBasis0 46 j + (-96) * largeBasis0 52 j + (36) * largeBasis0 57 j

def largeInverse0Row07 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 6 j + (-36) * largeBasis0 12 j + (-15) * largeBasis0 27 j + (30) * largeBasis0 33 j + (-15) * largeBasis0 38 j + (15) * largeBasis0 46 j + (-24) * largeBasis0 52 j + (9) * largeBasis0 57 j

def largeInverse0Row08 (_j : Fin 80) : ℤ :=
  0

def largeInverse0Row09 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 18 j

def largeInverse0Row10 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 21 j

def largeInverse0Row11 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 24 j

def largeInverse0Row12 (_j : Fin 80) : ℤ :=
  0

def largeInverse0Row13 (j : Fin 80) : ℤ :=
  (-54) * largeBasis0 1 j + (216) * largeBasis0 7 j + (-126) * largeBasis0 13 j + (54) * largeBasis0 47 j + (-54) * largeBasis0 53 j + (18) * largeBasis0 58 j

def largeInverse0Row14 (j : Fin 80) : ℤ :=
  (-162) * largeBasis0 2 j + (324) * largeBasis0 8 j + (-126) * largeBasis0 14 j + (162) * largeBasis0 29 j + (-162) * largeBasis0 35 j + (54) * largeBasis0 40 j

def largeInverse0Row15 (j : Fin 80) : ℤ :=
  (162) * largeBasis0 9 j + (-126) * largeBasis0 15 j + (-243) * largeBasis0 36 j + (162) * largeBasis0 41 j + (81) * largeBasis0 55 j + (-36) * largeBasis0 60 j

def largeInverse0Row16 (j : Fin 80) : ℤ :=
  (162) * largeBasis0 4 j + (-126) * largeBasis0 16 j + (-243) * largeBasis0 31 j + (81) * largeBasis0 42 j + (81) * largeBasis0 50 j + (-9) * largeBasis0 61 j

def largeInverse0Row17 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 17 j

def largeInverse0Row18 (j : Fin 80) : ℤ :=
  (18) * largeBasis0 1 j + (-72) * largeBasis0 7 j + (54) * largeBasis0 13 j + (-18) * largeBasis0 47 j + (18) * largeBasis0 53 j + (-6) * largeBasis0 58 j

def largeInverse0Row19 (j : Fin 80) : ℤ :=
  (12) * largeBasis0 39 j

def largeInverse0Row20 (j : Fin 80) : ℤ :=
  (-108) * largeBasis0 1 j + (216) * largeBasis0 7 j + (-108) * largeBasis0 13 j + (108) * largeBasis0 47 j + (-54) * largeBasis0 53 j + (12) * largeBasis0 58 j

def largeInverse0Row21 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 66 j

def largeInverse0Row22 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 71 j

def largeInverse0Row23 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 76 j

def largeInverse0Row24 (j : Fin 80) : ℤ :=
  (-72) * largeBasis0 1 j + (144) * largeBasis0 7 j + (-72) * largeBasis0 13 j + (36) * largeBasis0 28 j + (-12) * largeBasis0 39 j + (36) * largeBasis0 47 j + (-36) * largeBasis0 53 j + (12) * largeBasis0 58 j

def largeInverse0Row25 (j : Fin 80) : ℤ :=
  (-36) * largeBasis0 1 j + (72) * largeBasis0 7 j + (-36) * largeBasis0 13 j + (36) * largeBasis0 34 j + (-24) * largeBasis0 39 j + (36) * largeBasis0 47 j + (-36) * largeBasis0 53 j + (12) * largeBasis0 58 j

def largeInverse0Row26 (_j : Fin 80) : ℤ :=
  0

def largeInverse0Row27 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 43 j

def largeInverse0Row28 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 44 j

def largeInverse0Row29 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 45 j

def largeInverse0Row30 (j : Fin 80) : ℤ :=
  (30) * largeBasis0 27 j + (-96) * largeBasis0 33 j + (66) * largeBasis0 38 j + (-30) * largeBasis0 46 j + (48) * largeBasis0 52 j + (-18) * largeBasis0 57 j

def largeInverse0Row31 (_j : Fin 80) : ℤ :=
  0

def largeInverse0Row32 (j : Fin 80) : ℤ :=
  (-270) * largeBasis0 2 j + (432) * largeBasis0 8 j + (-162) * largeBasis0 14 j + (270) * largeBasis0 29 j + (-216) * largeBasis0 35 j + (66) * largeBasis0 40 j

def largeInverse0Row33 (j : Fin 80) : ℤ :=
  (54) * largeBasis0 9 j + (-54) * largeBasis0 15 j + (-81) * largeBasis0 36 j + (66) * largeBasis0 41 j + (27) * largeBasis0 55 j + (-12) * largeBasis0 60 j

def largeInverse0Row34 (j : Fin 80) : ℤ :=
  (108) * largeBasis0 4 j + (-108) * largeBasis0 16 j + (-162) * largeBasis0 31 j + (66) * largeBasis0 42 j + (54) * largeBasis0 50 j + (-6) * largeBasis0 61 j

def largeInverse0Row35 (j : Fin 80) : ℤ :=
  (-36) * largeBasis0 5 j + (36) * largeBasis0 17 j + (36) * largeBasis0 32 j

def largeInverse0Row36 (j : Fin 80) : ℤ :=
  (18) * largeBasis0 2 j + (-36) * largeBasis0 8 j + (18) * largeBasis0 14 j + (-18) * largeBasis0 29 j + (18) * largeBasis0 35 j + (-6) * largeBasis0 40 j

def largeInverse0Row37 (j : Fin 80) : ℤ :=
  (90) * largeBasis0 2 j + (-144) * largeBasis0 8 j + (54) * largeBasis0 14 j + (-90) * largeBasis0 29 j + (72) * largeBasis0 35 j + (-18) * largeBasis0 40 j

def largeInverse0Row38 (j : Fin 80) : ℤ :=
  (4) * largeBasis0 59 j

def largeInverse0Row39 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 67 j

def largeInverse0Row40 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 72 j

def largeInverse0Row41 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 77 j

def largeInverse0Row42 (j : Fin 80) : ℤ :=
  (-180) * largeBasis0 2 j + (288) * largeBasis0 8 j + (-108) * largeBasis0 14 j + (144) * largeBasis0 29 j + (-144) * largeBasis0 35 j + (48) * largeBasis0 40 j + (36) * largeBasis0 48 j + (-4) * largeBasis0 59 j

def largeInverse0Row43 (j : Fin 80) : ℤ :=
  (-360) * largeBasis0 2 j + (576) * largeBasis0 8 j + (-216) * largeBasis0 14 j + (360) * largeBasis0 29 j + (-360) * largeBasis0 35 j + (120) * largeBasis0 40 j + (36) * largeBasis0 54 j + (-16) * largeBasis0 59 j

def largeInverse0Row44 (_j : Fin 80) : ℤ :=
  0

def largeInverse0Row45 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 62 j

def largeInverse0Row46 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 63 j

def largeInverse0Row47 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 64 j

def largeInverse0Row48 (j : Fin 80) : ℤ :=
  (12) * largeBasis0 27 j + (-24) * largeBasis0 33 j + (12) * largeBasis0 38 j + (-12) * largeBasis0 46 j + (12) * largeBasis0 52 j

def largeInverse0Row49 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 1 j + (-72) * largeBasis0 7 j + (36) * largeBasis0 13 j + (-36) * largeBasis0 47 j + (18) * largeBasis0 53 j

def largeInverse0Row50 (_j : Fin 80) : ℤ :=
  0

def largeInverse0Row51 (j : Fin 80) : ℤ :=
  (18) * largeBasis0 9 j + (-18) * largeBasis0 15 j + (-27) * largeBasis0 36 j + (18) * largeBasis0 41 j + (9) * largeBasis0 55 j

def largeInverse0Row52 (j : Fin 80) : ℤ :=
  (72) * largeBasis0 4 j + (-72) * largeBasis0 16 j + (-108) * largeBasis0 31 j + (36) * largeBasis0 42 j + (36) * largeBasis0 50 j

def largeInverse0Row53 (j : Fin 80) : ℤ :=
  (-36) * largeBasis0 5 j + (36) * largeBasis0 17 j + (36) * largeBasis0 51 j

def largeInverse0Row54 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 3 j + (-162) * largeBasis0 9 j + (126) * largeBasis0 15 j + (243) * largeBasis0 36 j + (-162) * largeBasis0 41 j + (-81) * largeBasis0 55 j + (36) * largeBasis0 60 j

def largeInverse0Row55 (j : Fin 80) : ℤ :=
  (-54) * largeBasis0 9 j + (54) * largeBasis0 15 j + (36) * largeBasis0 30 j + (81) * largeBasis0 36 j + (-66) * largeBasis0 41 j + (-27) * largeBasis0 55 j + (12) * largeBasis0 60 j

def largeInverse0Row56 (j : Fin 80) : ℤ :=
  (-18) * largeBasis0 9 j + (18) * largeBasis0 15 j + (27) * largeBasis0 36 j + (-18) * largeBasis0 41 j + (36) * largeBasis0 49 j + (-9) * largeBasis0 55 j

def largeInverse0Row57 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 68 j

def largeInverse0Row58 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 73 j

def largeInverse0Row59 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 78 j

def largeInverse0Row60 (_j : Fin 80) : ℤ :=
  0

def largeInverse0Row61 (j : Fin 80) : ℤ :=
  (144) * largeBasis0 9 j + (-144) * largeBasis0 15 j + (-288) * largeBasis0 36 j + (192) * largeBasis0 41 j + (108) * largeBasis0 55 j + (-48) * largeBasis0 60 j

def largeInverse0Row62 (j : Fin 80) : ℤ :=
  (162) * largeBasis0 9 j + (-162) * largeBasis0 15 j + (-243) * largeBasis0 36 j + (162) * largeBasis0 41 j + (81) * largeBasis0 55 j + (-36) * largeBasis0 60 j

def largeInverse0Row63 (j : Fin 80) : ℤ :=
  (-36) * largeBasis0 19 j

def largeInverse0Row64 (j : Fin 80) : ℤ :=
  (-36) * largeBasis0 22 j

def largeInverse0Row65 (j : Fin 80) : ℤ :=
  (-36) * largeBasis0 25 j

def largeInverse0Row66 (j : Fin 80) : ℤ :=
  (-96) * largeBasis0 27 j + (192) * largeBasis0 33 j + (-96) * largeBasis0 38 j + (60) * largeBasis0 46 j + (-96) * largeBasis0 52 j + (36) * largeBasis0 57 j

def largeInverse0Row67 (j : Fin 80) : ℤ :=
  (-72) * largeBasis0 1 j + (144) * largeBasis0 7 j + (-72) * largeBasis0 13 j + (36) * largeBasis0 47 j + (-36) * largeBasis0 53 j + (12) * largeBasis0 58 j

def largeInverse0Row68 (j : Fin 80) : ℤ :=
  (-180) * largeBasis0 2 j + (288) * largeBasis0 8 j + (-108) * largeBasis0 14 j + (144) * largeBasis0 29 j + (-144) * largeBasis0 35 j + (48) * largeBasis0 40 j

def largeInverse0Row69 (_j : Fin 80) : ℤ :=
  0

def largeInverse0Row70 (j : Fin 80) : ℤ :=
  (144) * largeBasis0 4 j + (-144) * largeBasis0 16 j + (-288) * largeBasis0 31 j + (96) * largeBasis0 42 j + (108) * largeBasis0 50 j + (-12) * largeBasis0 61 j

def largeInverse0Row71 (j : Fin 80) : ℤ :=
  (-36) * largeBasis0 5 j + (36) * largeBasis0 17 j

def largeInverse0Row72 (j : Fin 80) : ℤ :=
  (-162) * largeBasis0 4 j + (36) * largeBasis0 10 j + (126) * largeBasis0 16 j + (243) * largeBasis0 31 j + (-81) * largeBasis0 42 j + (-81) * largeBasis0 50 j + (9) * largeBasis0 61 j

def largeInverse0Row73 (j : Fin 80) : ℤ :=
  (-216) * largeBasis0 4 j + (216) * largeBasis0 16 j + (324) * largeBasis0 31 j + (36) * largeBasis0 37 j + (-132) * largeBasis0 42 j + (-108) * largeBasis0 50 j + (12) * largeBasis0 61 j

def largeInverse0Row74 (j : Fin 80) : ℤ :=
  (-288) * largeBasis0 4 j + (288) * largeBasis0 16 j + (432) * largeBasis0 31 j + (-144) * largeBasis0 42 j + (-144) * largeBasis0 50 j + (36) * largeBasis0 56 j

def largeInverse0Row75 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 69 j

def largeInverse0Row76 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 74 j

def largeInverse0Row77 (j : Fin 80) : ℤ :=
  (36) * largeBasis0 79 j

def largeInverse0Row78 (j : Fin 80) : ℤ :=
  (-18) * largeBasis0 4 j + (18) * largeBasis0 16 j + (45) * largeBasis0 31 j + (-15) * largeBasis0 42 j + (-27) * largeBasis0 50 j + (3) * largeBasis0 61 j

def largeInverse0Row79 (_j : Fin 80) : ℤ :=
  0

def largeInverse0Row80 (j : Fin 80) : ℤ :=
  (162) * largeBasis0 4 j + (-162) * largeBasis0 16 j + (-243) * largeBasis0 31 j + (81) * largeBasis0 42 j + (81) * largeBasis0 50 j + (-9) * largeBasis0 61 j

def largeInverse0Row81 (j : Fin 80) : ℤ :=
  (-36) * largeBasis0 20 j

def largeInverse0Row82 (j : Fin 80) : ℤ :=
  (-36) * largeBasis0 23 j

def largeInverse0Row83 (j : Fin 80) : ℤ :=
  (-36) * largeBasis0 26 j

def largeInverse0Row84 (j : Fin 80) : ℤ :=
  (-15) * largeBasis0 27 j + (30) * largeBasis0 33 j + (-15) * largeBasis0 38 j + (15) * largeBasis0 46 j + (-24) * largeBasis0 52 j + (9) * largeBasis0 57 j

def largeInverse0Row85 (j : Fin 80) : ℤ :=
  (-18) * largeBasis0 1 j + (36) * largeBasis0 7 j + (-18) * largeBasis0 13 j + (18) * largeBasis0 47 j + (-18) * largeBasis0 53 j + (6) * largeBasis0 58 j

def largeInverse0Row86 (j : Fin 80) : ℤ :=
  (-90) * largeBasis0 2 j + (144) * largeBasis0 8 j + (-54) * largeBasis0 14 j + (90) * largeBasis0 29 j + (-90) * largeBasis0 35 j + (30) * largeBasis0 40 j

def largeInverse0Row87 (j : Fin 80) : ℤ :=
  (-18) * largeBasis0 9 j + (18) * largeBasis0 15 j + (45) * largeBasis0 36 j + (-30) * largeBasis0 41 j + (-27) * largeBasis0 55 j + (12) * largeBasis0 60 j

def largeInverse0Row88 (_j : Fin 80) : ℤ :=
  0

def largeInverse0Row89 (j : Fin 80) : ℤ :=
  (-36) * largeBasis0 11 j + (36) * largeBasis0 17 j

def largeInverse0 : Matrix (Param 6 6 6) (Fin 80) ℤ :=
  fun p => match p.2 with
  | Sum.inl i => ![![largeInverse0Row00, largeInverse0Row01, largeInverse0Row02, largeInverse0Row03, largeInverse0Row04, largeInverse0Row05], ![largeInverse0Row18, largeInverse0Row19, largeInverse0Row20, largeInverse0Row21, largeInverse0Row22, largeInverse0Row23], ![largeInverse0Row36, largeInverse0Row37, largeInverse0Row38, largeInverse0Row39, largeInverse0Row40, largeInverse0Row41], ![largeInverse0Row54, largeInverse0Row55, largeInverse0Row56, largeInverse0Row57, largeInverse0Row58, largeInverse0Row59], ![largeInverse0Row72, largeInverse0Row73, largeInverse0Row74, largeInverse0Row75, largeInverse0Row76, largeInverse0Row77]] p.1 i
  | Sum.inr (Sum.inl i) => ![![largeInverse0Row06, largeInverse0Row07, largeInverse0Row08, largeInverse0Row09, largeInverse0Row10, largeInverse0Row11], ![largeInverse0Row24, largeInverse0Row25, largeInverse0Row26, largeInverse0Row27, largeInverse0Row28, largeInverse0Row29], ![largeInverse0Row42, largeInverse0Row43, largeInverse0Row44, largeInverse0Row45, largeInverse0Row46, largeInverse0Row47], ![largeInverse0Row60, largeInverse0Row61, largeInverse0Row62, largeInverse0Row63, largeInverse0Row64, largeInverse0Row65], ![largeInverse0Row78, largeInverse0Row79, largeInverse0Row80, largeInverse0Row81, largeInverse0Row82, largeInverse0Row83]] p.1 i
  | Sum.inr (Sum.inr i) => ![![largeInverse0Row12, largeInverse0Row13, largeInverse0Row14, largeInverse0Row15, largeInverse0Row16, largeInverse0Row17], ![largeInverse0Row30, largeInverse0Row31, largeInverse0Row32, largeInverse0Row33, largeInverse0Row34, largeInverse0Row35], ![largeInverse0Row48, largeInverse0Row49, largeInverse0Row50, largeInverse0Row51, largeInverse0Row52, largeInverse0Row53], ![largeInverse0Row66, largeInverse0Row67, largeInverse0Row68, largeInverse0Row69, largeInverse0Row70, largeInverse0Row71], ![largeInverse0Row84, largeInverse0Row85, largeInverse0Row86, largeInverse0Row87, largeInverse0Row88, largeInverse0Row89]] p.1 i

end TR25
