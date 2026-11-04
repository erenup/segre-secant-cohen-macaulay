import TR25Family.Definitions

namespace TR25Family

def familyBasis1 (i j : Fin 50) : ℤ := if i = j then 1 else 0

def familyRows1 : Fin 50 → Coord 3 4 5 :=
  ![((0, 0), 0), ((0, 0), 1), ((0, 0), 2), ((0, 0), 3), ((0, 0), 4), ((0, 1), 0), ((0, 1), 1), ((0, 1), 2), ((0, 1), 3), ((0, 1), 4), ((0, 2), 0), ((0, 2), 1), ((0, 2), 2), ((0, 2), 3), ((0, 2), 4), ((0, 3), 0), ((0, 3), 3), ((0, 3), 4), ((1, 0), 0), ((1, 0), 1), ((1, 0), 2), ((1, 0), 3), ((1, 0), 4), ((1, 1), 0), ((1, 1), 1), ((1, 1), 2), ((1, 1), 3), ((1, 1), 4), ((1, 2), 0), ((1, 2), 1), ((1, 2), 2), ((1, 2), 3), ((1, 2), 4), ((1, 3), 1), ((2, 0), 0), ((2, 0), 1), ((2, 0), 2), ((2, 0), 3), ((2, 0), 4), ((2, 1), 0), ((2, 1), 1), ((2, 1), 2), ((2, 1), 3), ((2, 1), 4), ((2, 2), 0), ((2, 2), 1), ((2, 2), 2), ((2, 2), 3), ((2, 2), 4), ((2, 3), 2)]

def familySelected1 (R : Type*) [CommRing R] : Matrix (Fin 50) (Param 3 4 5) R :=
  (familyJacobian R 1).submatrix familyRows1 id

def familyInverse1Row00 (j : Fin 50) : ℤ :=
  (144) * familyBasis1 0 j + (108) * familyBasis1 1 j + (72) * familyBasis1 2 j + (144) * familyBasis1 3 j + (144) * familyBasis1 4 j + (-180) * familyBasis1 5 j + (-180) * familyBasis1 9 j + (36) * familyBasis1 10 j + (-108) * familyBasis1 11 j + (-72) * familyBasis1 12 j + (-144) * familyBasis1 13 j + (-177) * familyBasis1 18 j + (-192) * familyBasis1 19 j + (-120) * familyBasis1 20 j + (-192) * familyBasis1 21 j + (-192) * familyBasis1 22 j + (66) * familyBasis1 23 j + (96) * familyBasis1 24 j + (24) * familyBasis1 25 j + (-192) * familyBasis1 26 j + (96) * familyBasis1 27 j + (15) * familyBasis1 28 j + (24) * familyBasis1 30 j + (192) * familyBasis1 31 j + (33) * familyBasis1 34 j + (84) * familyBasis1 35 j + (48) * familyBasis1 36 j + (48) * familyBasis1 37 j + (48) * familyBasis1 38 j + (12) * familyBasis1 39 j + (-48) * familyBasis1 40 j + (-12) * familyBasis1 41 j + (96) * familyBasis1 42 j + (-12) * familyBasis1 43 j + (-9) * familyBasis1 44 j + (12) * familyBasis1 45 j + (-48) * familyBasis1 47 j

def familyInverse1Row01 (j : Fin 50) : ℤ :=
  (-90) * familyBasis1 18 j + (288) * familyBasis1 23 j + (-162) * familyBasis1 28 j + (90) * familyBasis1 34 j + (-144) * familyBasis1 39 j + (54) * familyBasis1 44 j

def familyInverse1Row02 (j : Fin 50) : ℤ :=
  (-108) * familyBasis1 18 j + (216) * familyBasis1 23 j + (-108) * familyBasis1 28 j + (108) * familyBasis1 34 j + (-108) * familyBasis1 39 j + (36) * familyBasis1 44 j

def familyInverse1Row03 (j : Fin 50) : ℤ :=
  (36) * familyBasis1 0 j + (-36) * familyBasis1 10 j + (-96) * familyBasis1 18 j + (192) * familyBasis1 23 j + (-96) * familyBasis1 28 j + (60) * familyBasis1 34 j + (-96) * familyBasis1 39 j + (36) * familyBasis1 44 j

def familyInverse1Row04 (j : Fin 50) : ℤ :=
  (36) * familyBasis1 5 j + (-36) * familyBasis1 10 j + (-15) * familyBasis1 18 j + (30) * familyBasis1 23 j + (-15) * familyBasis1 28 j + (15) * familyBasis1 34 j + (-24) * familyBasis1 39 j + (9) * familyBasis1 44 j

def familyInverse1Row05 (_j : Fin 50) : ℤ :=
  0

def familyInverse1Row06 (j : Fin 50) : ℤ :=
  (36) * familyBasis1 15 j

def familyInverse1Row07 (j : Fin 50) : ℤ :=
  (-144) * familyBasis1 0 j + (-108) * familyBasis1 1 j + (-72) * familyBasis1 2 j + (-144) * familyBasis1 3 j + (-144) * familyBasis1 4 j + (180) * familyBasis1 5 j + (180) * familyBasis1 9 j + (108) * familyBasis1 11 j + (72) * familyBasis1 12 j + (144) * familyBasis1 13 j + (192) * familyBasis1 18 j + (192) * familyBasis1 19 j + (120) * familyBasis1 20 j + (192) * familyBasis1 21 j + (192) * familyBasis1 22 j + (-96) * familyBasis1 23 j + (-96) * familyBasis1 24 j + (-24) * familyBasis1 25 j + (192) * familyBasis1 26 j + (-96) * familyBasis1 27 j + (-24) * familyBasis1 30 j + (-192) * familyBasis1 31 j + (-48) * familyBasis1 34 j + (-84) * familyBasis1 35 j + (-48) * familyBasis1 36 j + (-48) * familyBasis1 37 j + (-48) * familyBasis1 38 j + (12) * familyBasis1 39 j + (48) * familyBasis1 40 j + (12) * familyBasis1 41 j + (-96) * familyBasis1 42 j + (12) * familyBasis1 43 j + (-12) * familyBasis1 45 j + (48) * familyBasis1 47 j

def familyInverse1Row08 (j : Fin 50) : ℤ :=
  (-36) * familyBasis1 1 j + (180) * familyBasis1 6 j + (-108) * familyBasis1 11 j + (36) * familyBasis1 35 j + (-36) * familyBasis1 40 j + (12) * familyBasis1 45 j

def familyInverse1Row09 (j : Fin 50) : ℤ :=
  (-72) * familyBasis1 2 j + (180) * familyBasis1 7 j + (-72) * familyBasis1 12 j + (72) * familyBasis1 20 j + (-72) * familyBasis1 25 j + (24) * familyBasis1 30 j

def familyInverse1Row10 (j : Fin 50) : ℤ :=
  (180) * familyBasis1 8 j + (-144) * familyBasis1 13 j + (-288) * familyBasis1 26 j + (192) * familyBasis1 31 j + (108) * familyBasis1 42 j + (-48) * familyBasis1 47 j

def familyInverse1Row11 (_j : Fin 50) : ℤ :=
  0

def familyInverse1Row12 (j : Fin 50) : ℤ :=
  (18) * familyBasis1 1 j + (-72) * familyBasis1 6 j + (54) * familyBasis1 11 j + (-18) * familyBasis1 35 j + (18) * familyBasis1 40 j + (-6) * familyBasis1 45 j

def familyInverse1Row13 (j : Fin 50) : ℤ :=
  (216) * familyBasis1 0 j + (234) * familyBasis1 1 j + (36) * familyBasis1 2 j + (216) * familyBasis1 3 j + (216) * familyBasis1 4 j + (-216) * familyBasis1 5 j + (-252) * familyBasis1 6 j + (72) * familyBasis1 7 j + (-144) * familyBasis1 8 j + (-216) * familyBasis1 9 j + (18) * familyBasis1 11 j + (-108) * familyBasis1 12 j + (-72) * familyBasis1 13 j + (-243) * familyBasis1 18 j + (-288) * familyBasis1 19 j + (-108) * familyBasis1 20 j + (-288) * familyBasis1 21 j + (-288) * familyBasis1 22 j + (126) * familyBasis1 24 j + (126) * familyBasis1 27 j + (81) * familyBasis1 28 j + (12) * familyBasis1 29 j + (36) * familyBasis1 30 j + (96) * familyBasis1 31 j + (27) * familyBasis1 34 j + (54) * familyBasis1 35 j + (72) * familyBasis1 36 j + (72) * familyBasis1 37 j + (72) * familyBasis1 38 j + (54) * familyBasis1 39 j + (-18) * familyBasis1 41 j + (36) * familyBasis1 42 j + (-18) * familyBasis1 43 j + (-27) * familyBasis1 44 j + (-6) * familyBasis1 45 j + (-24) * familyBasis1 47 j

def familyInverse1Row14 (j : Fin 50) : ℤ :=
  (-108) * familyBasis1 1 j + (216) * familyBasis1 6 j + (-108) * familyBasis1 11 j + (108) * familyBasis1 35 j + (-54) * familyBasis1 40 j + (12) * familyBasis1 45 j

def familyInverse1Row15 (j : Fin 50) : ℤ :=
  (-72) * familyBasis1 1 j + (144) * familyBasis1 6 j + (-72) * familyBasis1 11 j + (36) * familyBasis1 19 j + (-12) * familyBasis1 29 j + (36) * familyBasis1 35 j + (-36) * familyBasis1 40 j + (12) * familyBasis1 45 j

def familyInverse1Row16 (j : Fin 50) : ℤ :=
  (-36) * familyBasis1 1 j + (72) * familyBasis1 6 j + (-36) * familyBasis1 11 j + (36) * familyBasis1 24 j + (-24) * familyBasis1 29 j + (36) * familyBasis1 35 j + (-36) * familyBasis1 40 j + (12) * familyBasis1 45 j

def familyInverse1Row17 (_j : Fin 50) : ℤ :=
  0

def familyInverse1Row18 (j : Fin 50) : ℤ :=
  (36) * familyBasis1 33 j

def familyInverse1Row19 (j : Fin 50) : ℤ :=
  (45) * familyBasis1 18 j + (-126) * familyBasis1 23 j + (81) * familyBasis1 28 j + (-45) * familyBasis1 34 j + (72) * familyBasis1 39 j + (-27) * familyBasis1 44 j

def familyInverse1Row20 (j : Fin 50) : ℤ :=
  (-216) * familyBasis1 0 j + (-216) * familyBasis1 1 j + (-36) * familyBasis1 2 j + (-216) * familyBasis1 3 j + (-216) * familyBasis1 4 j + (216) * familyBasis1 5 j + (216) * familyBasis1 6 j + (-72) * familyBasis1 7 j + (144) * familyBasis1 8 j + (216) * familyBasis1 9 j + (108) * familyBasis1 12 j + (72) * familyBasis1 13 j + (243) * familyBasis1 18 j + (288) * familyBasis1 19 j + (108) * familyBasis1 20 j + (288) * familyBasis1 21 j + (288) * familyBasis1 22 j + (-126) * familyBasis1 24 j + (-126) * familyBasis1 27 j + (-81) * familyBasis1 28 j + (-36) * familyBasis1 30 j + (-96) * familyBasis1 31 j + (-27) * familyBasis1 34 j + (-72) * familyBasis1 35 j + (-72) * familyBasis1 36 j + (-72) * familyBasis1 37 j + (-72) * familyBasis1 38 j + (-54) * familyBasis1 39 j + (18) * familyBasis1 40 j + (18) * familyBasis1 41 j + (-36) * familyBasis1 42 j + (18) * familyBasis1 43 j + (27) * familyBasis1 44 j + (24) * familyBasis1 47 j

def familyInverse1Row21 (j : Fin 50) : ℤ :=
  (-180) * familyBasis1 2 j + (288) * familyBasis1 7 j + (-108) * familyBasis1 12 j + (180) * familyBasis1 20 j + (-126) * familyBasis1 25 j + (36) * familyBasis1 30 j

def familyInverse1Row22 (j : Fin 50) : ℤ :=
  (72) * familyBasis1 8 j + (-72) * familyBasis1 13 j + (-126) * familyBasis1 26 j + (96) * familyBasis1 31 j + (54) * familyBasis1 42 j + (-24) * familyBasis1 47 j

def familyInverse1Row23 (_j : Fin 50) : ℤ :=
  0

def familyInverse1Row24 (j : Fin 50) : ℤ :=
  (18) * familyBasis1 2 j + (-36) * familyBasis1 7 j + (18) * familyBasis1 12 j + (-18) * familyBasis1 20 j + (18) * familyBasis1 25 j + (-6) * familyBasis1 30 j

def familyInverse1Row25 (j : Fin 50) : ℤ :=
  (90) * familyBasis1 2 j + (-144) * familyBasis1 7 j + (54) * familyBasis1 12 j + (-90) * familyBasis1 20 j + (72) * familyBasis1 25 j + (-18) * familyBasis1 30 j

def familyInverse1Row26 (j : Fin 50) : ℤ :=
  (324) * familyBasis1 0 j + (378) * familyBasis1 1 j + (414) * familyBasis1 2 j + (324) * familyBasis1 3 j + (324) * familyBasis1 4 j + (-324) * familyBasis1 5 j + (-432) * familyBasis1 6 j + (-468) * familyBasis1 7 j + (-288) * familyBasis1 8 j + (-324) * familyBasis1 9 j + (54) * familyBasis1 11 j + (54) * familyBasis1 12 j + (-36) * familyBasis1 13 j + (-405) * familyBasis1 18 j + (-432) * familyBasis1 19 j + (-522) * familyBasis1 20 j + (-432) * familyBasis1 21 j + (-432) * familyBasis1 22 j + (162) * familyBasis1 23 j + (216) * familyBasis1 24 j + (306) * familyBasis1 25 j + (144) * familyBasis1 26 j + (216) * familyBasis1 27 j + (27) * familyBasis1 28 j + (-30) * familyBasis1 30 j + (48) * familyBasis1 31 j + (81) * familyBasis1 34 j + (54) * familyBasis1 35 j + (108) * familyBasis1 36 j + (108) * familyBasis1 37 j + (108) * familyBasis1 38 j + (-36) * familyBasis1 41 j + (-36) * familyBasis1 43 j + (-9) * familyBasis1 44 j + (-6) * familyBasis1 45 j + (4) * familyBasis1 46 j + (-12) * familyBasis1 47 j

def familyInverse1Row27 (j : Fin 50) : ℤ :=
  (-180) * familyBasis1 2 j + (288) * familyBasis1 7 j + (-108) * familyBasis1 12 j + (144) * familyBasis1 20 j + (-144) * familyBasis1 25 j + (48) * familyBasis1 30 j + (36) * familyBasis1 36 j + (-4) * familyBasis1 46 j

def familyInverse1Row28 (j : Fin 50) : ℤ :=
  (-360) * familyBasis1 2 j + (576) * familyBasis1 7 j + (-216) * familyBasis1 12 j + (360) * familyBasis1 20 j + (-360) * familyBasis1 25 j + (120) * familyBasis1 30 j + (36) * familyBasis1 41 j + (-16) * familyBasis1 46 j

def familyInverse1Row29 (_j : Fin 50) : ℤ :=
  0

def familyInverse1Row30 (j : Fin 50) : ℤ :=
  (36) * familyBasis1 49 j

def familyInverse1Row31 (j : Fin 50) : ℤ :=
  (27) * familyBasis1 18 j + (-54) * familyBasis1 23 j + (27) * familyBasis1 28 j + (-27) * familyBasis1 34 j + (36) * familyBasis1 39 j + (-9) * familyBasis1 44 j

def familyInverse1Row32 (j : Fin 50) : ℤ :=
  (54) * familyBasis1 1 j + (-108) * familyBasis1 6 j + (54) * familyBasis1 11 j + (-54) * familyBasis1 35 j + (36) * familyBasis1 40 j + (-6) * familyBasis1 45 j

def familyInverse1Row33 (j : Fin 50) : ℤ :=
  (-324) * familyBasis1 0 j + (-378) * familyBasis1 1 j + (-324) * familyBasis1 2 j + (-324) * familyBasis1 3 j + (-324) * familyBasis1 4 j + (324) * familyBasis1 5 j + (432) * familyBasis1 6 j + (324) * familyBasis1 7 j + (288) * familyBasis1 8 j + (324) * familyBasis1 9 j + (-54) * familyBasis1 11 j + (36) * familyBasis1 13 j + (405) * familyBasis1 18 j + (432) * familyBasis1 19 j + (432) * familyBasis1 20 j + (432) * familyBasis1 21 j + (432) * familyBasis1 22 j + (-162) * familyBasis1 23 j + (-216) * familyBasis1 24 j + (-216) * familyBasis1 25 j + (-144) * familyBasis1 26 j + (-216) * familyBasis1 27 j + (-27) * familyBasis1 28 j + (-48) * familyBasis1 31 j + (-81) * familyBasis1 34 j + (-54) * familyBasis1 35 j + (-108) * familyBasis1 36 j + (-108) * familyBasis1 37 j + (-108) * familyBasis1 38 j + (36) * familyBasis1 41 j + (36) * familyBasis1 43 j + (9) * familyBasis1 44 j + (6) * familyBasis1 45 j + (12) * familyBasis1 47 j

def familyInverse1Row34 (j : Fin 50) : ℤ :=
  (36) * familyBasis1 8 j + (-36) * familyBasis1 13 j + (-72) * familyBasis1 26 j + (48) * familyBasis1 31 j + (36) * familyBasis1 42 j + (-12) * familyBasis1 47 j

def familyInverse1Row35 (_j : Fin 50) : ℤ :=
  0

def familyInverse1Row36 (j : Fin 50) : ℤ :=
  (-162) * familyBasis1 0 j + (-108) * familyBasis1 1 j + (-72) * familyBasis1 2 j + (-126) * familyBasis1 3 j + (-162) * familyBasis1 4 j + (162) * familyBasis1 5 j + (54) * familyBasis1 6 j + (18) * familyBasis1 7 j + (-18) * familyBasis1 8 j + (162) * familyBasis1 9 j + (54) * familyBasis1 11 j + (54) * familyBasis1 12 j + (144) * familyBasis1 13 j + (243) * familyBasis1 18 j + (162) * familyBasis1 19 j + (108) * familyBasis1 20 j + (162) * familyBasis1 21 j + (162) * familyBasis1 22 j + (-243) * familyBasis1 23 j + (-81) * familyBasis1 24 j + (-27) * familyBasis1 25 j + (207) * familyBasis1 26 j + (-81) * familyBasis1 27 j + (81) * familyBasis1 28 j + (-18) * familyBasis1 30 j + (-192) * familyBasis1 31 j + (-81) * familyBasis1 34 j + (-54) * familyBasis1 35 j + (-36) * familyBasis1 36 j + (-36) * familyBasis1 37 j + (-36) * familyBasis1 38 j + (81) * familyBasis1 39 j + (27) * familyBasis1 40 j + (9) * familyBasis1 41 j + (-99) * familyBasis1 42 j + (9) * familyBasis1 43 j + (-27) * familyBasis1 44 j + (-6) * familyBasis1 45 j + (48) * familyBasis1 47 j

def familyInverse1Row37 (j : Fin 50) : ℤ :=
  (-162) * familyBasis1 0 j + (-108) * familyBasis1 1 j + (-72) * familyBasis1 2 j + (-162) * familyBasis1 3 j + (-162) * familyBasis1 4 j + (162) * familyBasis1 5 j + (54) * familyBasis1 6 j + (18) * familyBasis1 7 j + (90) * familyBasis1 8 j + (162) * familyBasis1 9 j + (54) * familyBasis1 11 j + (54) * familyBasis1 12 j + (72) * familyBasis1 13 j + (243) * familyBasis1 18 j + (162) * familyBasis1 19 j + (108) * familyBasis1 20 j + (198) * familyBasis1 21 j + (162) * familyBasis1 22 j + (-243) * familyBasis1 23 j + (-81) * familyBasis1 24 j + (-27) * familyBasis1 25 j + (45) * familyBasis1 26 j + (-81) * familyBasis1 27 j + (81) * familyBasis1 28 j + (-18) * familyBasis1 30 j + (-96) * familyBasis1 31 j + (-81) * familyBasis1 34 j + (-54) * familyBasis1 35 j + (-36) * familyBasis1 36 j + (-36) * familyBasis1 37 j + (-36) * familyBasis1 38 j + (81) * familyBasis1 39 j + (27) * familyBasis1 40 j + (9) * familyBasis1 41 j + (-45) * familyBasis1 42 j + (9) * familyBasis1 43 j + (-27) * familyBasis1 44 j + (-6) * familyBasis1 45 j + (24) * familyBasis1 47 j

def familyInverse1Row38 (j : Fin 50) : ℤ :=
  (-162) * familyBasis1 0 j + (-108) * familyBasis1 1 j + (-72) * familyBasis1 2 j + (-162) * familyBasis1 3 j + (-162) * familyBasis1 4 j + (162) * familyBasis1 5 j + (54) * familyBasis1 6 j + (18) * familyBasis1 7 j + (126) * familyBasis1 8 j + (162) * familyBasis1 9 j + (54) * familyBasis1 11 j + (54) * familyBasis1 12 j + (36) * familyBasis1 13 j + (243) * familyBasis1 18 j + (162) * familyBasis1 19 j + (108) * familyBasis1 20 j + (162) * familyBasis1 21 j + (162) * familyBasis1 22 j + (-243) * familyBasis1 23 j + (-81) * familyBasis1 24 j + (-27) * familyBasis1 25 j + (-9) * familyBasis1 26 j + (-81) * familyBasis1 27 j + (81) * familyBasis1 28 j + (-18) * familyBasis1 30 j + (-48) * familyBasis1 31 j + (-81) * familyBasis1 34 j + (-54) * familyBasis1 35 j + (-36) * familyBasis1 36 j + (-36) * familyBasis1 38 j + (81) * familyBasis1 39 j + (27) * familyBasis1 40 j + (9) * familyBasis1 41 j + (-27) * familyBasis1 42 j + (9) * familyBasis1 43 j + (-27) * familyBasis1 44 j + (-6) * familyBasis1 45 j + (12) * familyBasis1 47 j

def familyInverse1Row39 (_j : Fin 50) : ℤ :=
  0

def familyInverse1Row40 (j : Fin 50) : ℤ :=
  (144) * familyBasis1 8 j + (-144) * familyBasis1 13 j + (-288) * familyBasis1 26 j + (192) * familyBasis1 31 j + (108) * familyBasis1 42 j + (-48) * familyBasis1 47 j

def familyInverse1Row41 (j : Fin 50) : ℤ :=
  (162) * familyBasis1 8 j + (-162) * familyBasis1 13 j + (-243) * familyBasis1 26 j + (162) * familyBasis1 31 j + (81) * familyBasis1 42 j + (-36) * familyBasis1 47 j

def familyInverse1Row42 (j : Fin 50) : ℤ :=
  (-36) * familyBasis1 16 j

def familyInverse1Row43 (j : Fin 50) : ℤ :=
  (-81) * familyBasis1 18 j + (162) * familyBasis1 23 j + (-81) * familyBasis1 28 j + (45) * familyBasis1 34 j + (-72) * familyBasis1 39 j + (27) * familyBasis1 44 j

def familyInverse1Row44 (j : Fin 50) : ℤ :=
  (-54) * familyBasis1 1 j + (108) * familyBasis1 6 j + (-54) * familyBasis1 11 j + (18) * familyBasis1 35 j + (-18) * familyBasis1 40 j + (6) * familyBasis1 45 j

def familyInverse1Row45 (j : Fin 50) : ℤ :=
  (-90) * familyBasis1 2 j + (144) * familyBasis1 7 j + (-54) * familyBasis1 12 j + (54) * familyBasis1 20 j + (-54) * familyBasis1 25 j + (18) * familyBasis1 30 j

def familyInverse1Row46 (j : Fin 50) : ℤ :=
  (-162) * familyBasis1 0 j + (-108) * familyBasis1 1 j + (-72) * familyBasis1 2 j + (-162) * familyBasis1 3 j + (-162) * familyBasis1 4 j + (162) * familyBasis1 5 j + (54) * familyBasis1 6 j + (18) * familyBasis1 7 j + (162) * familyBasis1 8 j + (162) * familyBasis1 9 j + (54) * familyBasis1 11 j + (54) * familyBasis1 12 j + (243) * familyBasis1 18 j + (162) * familyBasis1 19 j + (108) * familyBasis1 20 j + (162) * familyBasis1 21 j + (162) * familyBasis1 22 j + (-243) * familyBasis1 23 j + (-81) * familyBasis1 24 j + (-27) * familyBasis1 25 j + (-81) * familyBasis1 26 j + (-81) * familyBasis1 27 j + (81) * familyBasis1 28 j + (-18) * familyBasis1 30 j + (-81) * familyBasis1 34 j + (-54) * familyBasis1 35 j + (-36) * familyBasis1 36 j + (-36) * familyBasis1 37 j + (-36) * familyBasis1 38 j + (81) * familyBasis1 39 j + (27) * familyBasis1 40 j + (9) * familyBasis1 41 j + (9) * familyBasis1 42 j + (9) * familyBasis1 43 j + (-27) * familyBasis1 44 j + (-6) * familyBasis1 45 j

def familyInverse1Row47 (_j : Fin 50) : ℤ :=
  0

def familyInverse1Row48 (j : Fin 50) : ℤ :=
  (144) * familyBasis1 0 j + (162) * familyBasis1 1 j + (234) * familyBasis1 2 j + (144) * familyBasis1 3 j + (144) * familyBasis1 4 j + (-180) * familyBasis1 5 j + (-216) * familyBasis1 6 j + (-324) * familyBasis1 7 j + (-162) * familyBasis1 8 j + (-180) * familyBasis1 9 j + (36) * familyBasis1 10 j + (54) * familyBasis1 11 j + (90) * familyBasis1 12 j + (18) * familyBasis1 13 j + (36) * familyBasis1 14 j + (-177) * familyBasis1 18 j + (-192) * familyBasis1 19 j + (-282) * familyBasis1 20 j + (-192) * familyBasis1 21 j + (-192) * familyBasis1 22 j + (66) * familyBasis1 23 j + (96) * familyBasis1 24 j + (186) * familyBasis1 25 j + (51) * familyBasis1 26 j + (96) * familyBasis1 27 j + (15) * familyBasis1 28 j + (-30) * familyBasis1 30 j + (30) * familyBasis1 31 j + (33) * familyBasis1 34 j + (30) * familyBasis1 35 j + (48) * familyBasis1 36 j + (48) * familyBasis1 37 j + (48) * familyBasis1 38 j + (12) * familyBasis1 39 j + (6) * familyBasis1 40 j + (-12) * familyBasis1 41 j + (15) * familyBasis1 42 j + (-12) * familyBasis1 43 j + (-9) * familyBasis1 44 j + (-6) * familyBasis1 45 j + (-12) * familyBasis1 47 j

def familyInverse1Row49 (j : Fin 50) : ℤ :=
  (648) * familyBasis1 0 j + (702) * familyBasis1 1 j + (918) * familyBasis1 2 j + (648) * familyBasis1 3 j + (648) * familyBasis1 4 j + (-648) * familyBasis1 5 j + (-756) * familyBasis1 6 j + (-1080) * familyBasis1 7 j + (-594) * familyBasis1 8 j + (-648) * familyBasis1 9 j + (54) * familyBasis1 11 j + (162) * familyBasis1 12 j + (-54) * familyBasis1 13 j + (-819) * familyBasis1 18 j + (-864) * familyBasis1 19 j + (-1134) * familyBasis1 20 j + (-864) * familyBasis1 21 j + (-864) * familyBasis1 22 j + (288) * familyBasis1 23 j + (378) * familyBasis1 24 j + (648) * familyBasis1 25 j + (243) * familyBasis1 26 j + (378) * familyBasis1 27 j + (81) * familyBasis1 28 j + (36) * familyBasis1 29 j + (-54) * familyBasis1 30 j + (126) * familyBasis1 31 j + (36) * familyBasis1 32 j + (171) * familyBasis1 34 j + (162) * familyBasis1 35 j + (216) * familyBasis1 36 j + (216) * familyBasis1 37 j + (216) * familyBasis1 38 j + (18) * familyBasis1 39 j + (-54) * familyBasis1 41 j + (27) * familyBasis1 42 j + (-54) * familyBasis1 43 j + (-27) * familyBasis1 44 j + (-18) * familyBasis1 45 j + (-36) * familyBasis1 47 j

def familyInverse1Row50 (j : Fin 50) : ℤ :=
  (2916) * familyBasis1 0 j + (3078) * familyBasis1 1 j + (3726) * familyBasis1 2 j + (2916) * familyBasis1 3 j + (2916) * familyBasis1 4 j + (-2916) * familyBasis1 5 j + (-3240) * familyBasis1 6 j + (-4212) * familyBasis1 7 j + (-2754) * familyBasis1 8 j + (-2916) * familyBasis1 9 j + (162) * familyBasis1 11 j + (486) * familyBasis1 12 j + (-162) * familyBasis1 13 j + (-3753) * familyBasis1 18 j + (-3888) * familyBasis1 19 j + (-4698) * familyBasis1 20 j + (-3888) * familyBasis1 21 j + (-3888) * familyBasis1 22 j + (1674) * familyBasis1 23 j + (1944) * familyBasis1 24 j + (2754) * familyBasis1 25 j + (1539) * familyBasis1 26 j + (1944) * familyBasis1 27 j + (135) * familyBasis1 28 j + (-270) * familyBasis1 30 j + (270) * familyBasis1 31 j + (837) * familyBasis1 34 j + (810) * familyBasis1 35 j + (972) * familyBasis1 36 j + (972) * familyBasis1 37 j + (972) * familyBasis1 38 j + (-108) * familyBasis1 39 j + (-162) * familyBasis1 40 j + (-324) * familyBasis1 41 j + (-81) * familyBasis1 42 j + (-324) * familyBasis1 43 j + (-45) * familyBasis1 44 j + (-18) * familyBasis1 45 j + (36) * familyBasis1 46 j + (-72) * familyBasis1 47 j + (36) * familyBasis1 48 j

def familyInverse1Row51 (j : Fin 50) : ℤ :=
  (18) * familyBasis1 0 j + (18) * familyBasis1 1 j + (18) * familyBasis1 2 j + (18) * familyBasis1 3 j + (18) * familyBasis1 4 j + (-18) * familyBasis1 5 j + (-18) * familyBasis1 6 j + (-18) * familyBasis1 7 j + (-18) * familyBasis1 8 j + (-18) * familyBasis1 9 j + (-30) * familyBasis1 18 j + (-30) * familyBasis1 19 j + (-30) * familyBasis1 20 j + (-30) * familyBasis1 21 j + (-30) * familyBasis1 22 j + (15) * familyBasis1 23 j + (15) * familyBasis1 24 j + (15) * familyBasis1 25 j + (15) * familyBasis1 26 j + (15) * familyBasis1 27 j + (12) * familyBasis1 34 j + (12) * familyBasis1 35 j + (12) * familyBasis1 36 j + (12) * familyBasis1 37 j + (12) * familyBasis1 38 j + (-3) * familyBasis1 39 j + (-3) * familyBasis1 40 j + (-3) * familyBasis1 41 j + (-3) * familyBasis1 42 j + (-3) * familyBasis1 43 j

def familyInverse1Row52 (j : Fin 50) : ℤ :=
  (144) * familyBasis1 0 j + (144) * familyBasis1 1 j + (144) * familyBasis1 2 j + (144) * familyBasis1 3 j + (144) * familyBasis1 4 j + (-144) * familyBasis1 5 j + (-144) * familyBasis1 6 j + (-144) * familyBasis1 7 j + (-144) * familyBasis1 8 j + (-144) * familyBasis1 9 j + (-192) * familyBasis1 18 j + (-192) * familyBasis1 19 j + (-192) * familyBasis1 20 j + (-192) * familyBasis1 21 j + (-192) * familyBasis1 22 j + (96) * familyBasis1 23 j + (96) * familyBasis1 24 j + (96) * familyBasis1 25 j + (96) * familyBasis1 26 j + (96) * familyBasis1 27 j + (48) * familyBasis1 34 j + (48) * familyBasis1 35 j + (48) * familyBasis1 36 j + (48) * familyBasis1 37 j + (48) * familyBasis1 38 j + (-12) * familyBasis1 39 j + (-12) * familyBasis1 40 j + (-12) * familyBasis1 41 j + (-12) * familyBasis1 42 j + (-12) * familyBasis1 43 j

def familyInverse1Row53 (_j : Fin 50) : ℤ :=
  0

def familyInverse1Row54 (j : Fin 50) : ℤ :=
  (36) * familyBasis1 15 j + (36) * familyBasis1 16 j + (36) * familyBasis1 17 j

def familyInverse1Row55 (j : Fin 50) : ℤ :=
  (-15) * familyBasis1 18 j + (30) * familyBasis1 23 j + (-15) * familyBasis1 28 j + (15) * familyBasis1 34 j + (-24) * familyBasis1 39 j + (9) * familyBasis1 44 j

def familyInverse1Row56 (j : Fin 50) : ℤ :=
  (-18) * familyBasis1 1 j + (36) * familyBasis1 6 j + (-18) * familyBasis1 11 j + (18) * familyBasis1 35 j + (-18) * familyBasis1 40 j + (6) * familyBasis1 45 j

def familyInverse1Row57 (j : Fin 50) : ℤ :=
  (-90) * familyBasis1 2 j + (144) * familyBasis1 7 j + (-54) * familyBasis1 12 j + (90) * familyBasis1 20 j + (-90) * familyBasis1 25 j + (30) * familyBasis1 30 j

def familyInverse1Row58 (j : Fin 50) : ℤ :=
  (-18) * familyBasis1 8 j + (18) * familyBasis1 13 j + (45) * familyBasis1 26 j + (-30) * familyBasis1 31 j + (-27) * familyBasis1 42 j + (12) * familyBasis1 47 j

def familyInverse1Row59 (_j : Fin 50) : ℤ :=
  0

def familyInverse1 : Matrix (Param 3 4 5) (Fin 50) ℤ :=
  fun p => match p.2 with
  | Sum.inl i => ![![familyInverse1Row00, familyInverse1Row01, familyInverse1Row02], ![familyInverse1Row12, familyInverse1Row13, familyInverse1Row14], ![familyInverse1Row24, familyInverse1Row25, familyInverse1Row26], ![familyInverse1Row36, familyInverse1Row37, familyInverse1Row38], ![familyInverse1Row48, familyInverse1Row49, familyInverse1Row50]] p.1 i
  | Sum.inr (Sum.inl i) => ![![familyInverse1Row03, familyInverse1Row04, familyInverse1Row05, familyInverse1Row06], ![familyInverse1Row15, familyInverse1Row16, familyInverse1Row17, familyInverse1Row18], ![familyInverse1Row27, familyInverse1Row28, familyInverse1Row29, familyInverse1Row30], ![familyInverse1Row39, familyInverse1Row40, familyInverse1Row41, familyInverse1Row42], ![familyInverse1Row51, familyInverse1Row52, familyInverse1Row53, familyInverse1Row54]] p.1 i
  | Sum.inr (Sum.inr i) => ![![familyInverse1Row07, familyInverse1Row08, familyInverse1Row09, familyInverse1Row10, familyInverse1Row11], ![familyInverse1Row19, familyInverse1Row20, familyInverse1Row21, familyInverse1Row22, familyInverse1Row23], ![familyInverse1Row31, familyInverse1Row32, familyInverse1Row33, familyInverse1Row34, familyInverse1Row35], ![familyInverse1Row43, familyInverse1Row44, familyInverse1Row45, familyInverse1Row46, familyInverse1Row47], ![familyInverse1Row55, familyInverse1Row56, familyInverse1Row57, familyInverse1Row58, familyInverse1Row59]] p.1 i

end TR25Family
