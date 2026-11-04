import TR25.Definitions

namespace TR25

def largeBasis1 (i j : Fin 80) : ℤ := if i = j then 1 else 0

def largeRows1 : Fin 80 → Coord 6 6 6 :=
  ![((0, 0), 0), ((0, 0), 1), ((0, 0), 2), ((0, 0), 3), ((0, 0), 4), ((0, 0), 5), ((0, 1), 0), ((0, 1), 1), ((0, 1), 2), ((0, 1), 3), ((0, 1), 4), ((0, 1), 5), ((0, 2), 0), ((0, 2), 1), ((0, 2), 2), ((0, 2), 3), ((0, 2), 4), ((0, 2), 5), ((0, 3), 0), ((0, 3), 3), ((0, 3), 4), ((0, 4), 0), ((0, 4), 3), ((0, 4), 4), ((0, 5), 0), ((0, 5), 3), ((0, 5), 4), ((1, 0), 0), ((1, 0), 1), ((1, 0), 2), ((1, 0), 3), ((1, 0), 4), ((1, 0), 5), ((1, 1), 0), ((1, 1), 1), ((1, 1), 2), ((1, 1), 3), ((1, 1), 4), ((1, 2), 0), ((1, 2), 1), ((1, 2), 2), ((1, 2), 3), ((1, 2), 4), ((1, 3), 1), ((1, 4), 1), ((1, 5), 1), ((2, 0), 0), ((2, 0), 1), ((2, 0), 2), ((2, 0), 3), ((2, 0), 4), ((2, 0), 5), ((2, 1), 0), ((2, 1), 1), ((2, 1), 2), ((2, 1), 3), ((2, 1), 4), ((2, 2), 0), ((2, 2), 1), ((2, 2), 2), ((2, 2), 3), ((2, 2), 4), ((2, 3), 2), ((2, 4), 2), ((2, 5), 2), ((3, 0), 0), ((3, 0), 1), ((3, 0), 2), ((3, 0), 3), ((3, 2), 4), ((4, 0), 0), ((4, 0), 1), ((4, 0), 2), ((4, 0), 3), ((4, 2), 4), ((5, 0), 0), ((5, 0), 1), ((5, 0), 2), ((5, 0), 3), ((5, 2), 4)]

def largeSelected1 (R : Type*) [CommRing R] : Matrix (Fin 80) (Param 6 6 6) R :=
  (embeddedJacobian R 1).submatrix largeRows1 id

def largeInverse1Row00 (j : Fin 80) : ℤ :=
  (144) * largeBasis1 0 j + (108) * largeBasis1 1 j + (72) * largeBasis1 2 j + (144) * largeBasis1 3 j + (144) * largeBasis1 4 j + (-180) * largeBasis1 6 j + (-180) * largeBasis1 10 j + (36) * largeBasis1 12 j + (-108) * largeBasis1 13 j + (-72) * largeBasis1 14 j + (-144) * largeBasis1 15 j + (-177) * largeBasis1 27 j + (-192) * largeBasis1 28 j + (-120) * largeBasis1 29 j + (-192) * largeBasis1 30 j + (-192) * largeBasis1 31 j + (66) * largeBasis1 33 j + (96) * largeBasis1 34 j + (24) * largeBasis1 35 j + (-192) * largeBasis1 36 j + (96) * largeBasis1 37 j + (15) * largeBasis1 38 j + (24) * largeBasis1 40 j + (192) * largeBasis1 41 j + (33) * largeBasis1 46 j + (84) * largeBasis1 47 j + (48) * largeBasis1 48 j + (48) * largeBasis1 49 j + (48) * largeBasis1 50 j + (12) * largeBasis1 52 j + (-48) * largeBasis1 53 j + (-12) * largeBasis1 54 j + (96) * largeBasis1 55 j + (-12) * largeBasis1 56 j + (-9) * largeBasis1 57 j + (12) * largeBasis1 58 j + (-48) * largeBasis1 60 j

def largeInverse1Row01 (j : Fin 80) : ℤ :=
  (-90) * largeBasis1 27 j + (288) * largeBasis1 33 j + (-162) * largeBasis1 38 j + (90) * largeBasis1 46 j + (-144) * largeBasis1 52 j + (54) * largeBasis1 57 j

def largeInverse1Row02 (j : Fin 80) : ℤ :=
  (-108) * largeBasis1 27 j + (216) * largeBasis1 33 j + (-108) * largeBasis1 38 j + (108) * largeBasis1 46 j + (-108) * largeBasis1 52 j + (36) * largeBasis1 57 j

def largeInverse1Row03 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 65 j

def largeInverse1Row04 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 70 j

def largeInverse1Row05 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 75 j

def largeInverse1Row06 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 0 j + (-36) * largeBasis1 12 j + (-96) * largeBasis1 27 j + (192) * largeBasis1 33 j + (-96) * largeBasis1 38 j + (60) * largeBasis1 46 j + (-96) * largeBasis1 52 j + (36) * largeBasis1 57 j

def largeInverse1Row07 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 6 j + (-36) * largeBasis1 12 j + (-15) * largeBasis1 27 j + (30) * largeBasis1 33 j + (-15) * largeBasis1 38 j + (15) * largeBasis1 46 j + (-24) * largeBasis1 52 j + (9) * largeBasis1 57 j

def largeInverse1Row08 (_j : Fin 80) : ℤ :=
  0

def largeInverse1Row09 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 18 j

def largeInverse1Row10 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 21 j

def largeInverse1Row11 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 24 j

def largeInverse1Row12 (j : Fin 80) : ℤ :=
  (-144) * largeBasis1 0 j + (-108) * largeBasis1 1 j + (-72) * largeBasis1 2 j + (-144) * largeBasis1 3 j + (-144) * largeBasis1 4 j + (180) * largeBasis1 6 j + (180) * largeBasis1 10 j + (108) * largeBasis1 13 j + (72) * largeBasis1 14 j + (144) * largeBasis1 15 j + (192) * largeBasis1 27 j + (192) * largeBasis1 28 j + (120) * largeBasis1 29 j + (192) * largeBasis1 30 j + (192) * largeBasis1 31 j + (-96) * largeBasis1 33 j + (-96) * largeBasis1 34 j + (-24) * largeBasis1 35 j + (192) * largeBasis1 36 j + (-96) * largeBasis1 37 j + (-24) * largeBasis1 40 j + (-192) * largeBasis1 41 j + (-48) * largeBasis1 46 j + (-84) * largeBasis1 47 j + (-48) * largeBasis1 48 j + (-48) * largeBasis1 49 j + (-48) * largeBasis1 50 j + (12) * largeBasis1 52 j + (48) * largeBasis1 53 j + (12) * largeBasis1 54 j + (-96) * largeBasis1 55 j + (12) * largeBasis1 56 j + (-12) * largeBasis1 58 j + (48) * largeBasis1 60 j

def largeInverse1Row13 (j : Fin 80) : ℤ :=
  (-36) * largeBasis1 1 j + (180) * largeBasis1 7 j + (-108) * largeBasis1 13 j + (36) * largeBasis1 47 j + (-36) * largeBasis1 53 j + (12) * largeBasis1 58 j

def largeInverse1Row14 (j : Fin 80) : ℤ :=
  (-72) * largeBasis1 2 j + (180) * largeBasis1 8 j + (-72) * largeBasis1 14 j + (72) * largeBasis1 29 j + (-72) * largeBasis1 35 j + (24) * largeBasis1 40 j

def largeInverse1Row15 (j : Fin 80) : ℤ :=
  (180) * largeBasis1 9 j + (-144) * largeBasis1 15 j + (-288) * largeBasis1 36 j + (192) * largeBasis1 41 j + (108) * largeBasis1 55 j + (-48) * largeBasis1 60 j

def largeInverse1Row16 (_j : Fin 80) : ℤ :=
  0

def largeInverse1Row17 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 11 j

def largeInverse1Row18 (j : Fin 80) : ℤ :=
  (18) * largeBasis1 1 j + (-72) * largeBasis1 7 j + (54) * largeBasis1 13 j + (-18) * largeBasis1 47 j + (18) * largeBasis1 53 j + (-6) * largeBasis1 58 j

def largeInverse1Row19 (j : Fin 80) : ℤ :=
  (216) * largeBasis1 0 j + (234) * largeBasis1 1 j + (36) * largeBasis1 2 j + (216) * largeBasis1 3 j + (216) * largeBasis1 4 j + (-216) * largeBasis1 6 j + (-252) * largeBasis1 7 j + (72) * largeBasis1 8 j + (-144) * largeBasis1 9 j + (-216) * largeBasis1 10 j + (18) * largeBasis1 13 j + (-108) * largeBasis1 14 j + (-72) * largeBasis1 15 j + (-243) * largeBasis1 27 j + (-288) * largeBasis1 28 j + (-108) * largeBasis1 29 j + (-288) * largeBasis1 30 j + (-288) * largeBasis1 31 j + (126) * largeBasis1 34 j + (126) * largeBasis1 37 j + (81) * largeBasis1 38 j + (12) * largeBasis1 39 j + (36) * largeBasis1 40 j + (96) * largeBasis1 41 j + (27) * largeBasis1 46 j + (54) * largeBasis1 47 j + (72) * largeBasis1 48 j + (72) * largeBasis1 49 j + (72) * largeBasis1 50 j + (54) * largeBasis1 52 j + (-18) * largeBasis1 54 j + (36) * largeBasis1 55 j + (-18) * largeBasis1 56 j + (-27) * largeBasis1 57 j + (-6) * largeBasis1 58 j + (-24) * largeBasis1 60 j

def largeInverse1Row20 (j : Fin 80) : ℤ :=
  (-108) * largeBasis1 1 j + (216) * largeBasis1 7 j + (-108) * largeBasis1 13 j + (108) * largeBasis1 47 j + (-54) * largeBasis1 53 j + (12) * largeBasis1 58 j

def largeInverse1Row21 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 66 j

def largeInverse1Row22 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 71 j

def largeInverse1Row23 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 76 j

def largeInverse1Row24 (j : Fin 80) : ℤ :=
  (-72) * largeBasis1 1 j + (144) * largeBasis1 7 j + (-72) * largeBasis1 13 j + (36) * largeBasis1 28 j + (-12) * largeBasis1 39 j + (36) * largeBasis1 47 j + (-36) * largeBasis1 53 j + (12) * largeBasis1 58 j

def largeInverse1Row25 (j : Fin 80) : ℤ :=
  (-36) * largeBasis1 1 j + (72) * largeBasis1 7 j + (-36) * largeBasis1 13 j + (36) * largeBasis1 34 j + (-24) * largeBasis1 39 j + (36) * largeBasis1 47 j + (-36) * largeBasis1 53 j + (12) * largeBasis1 58 j

def largeInverse1Row26 (_j : Fin 80) : ℤ :=
  0

def largeInverse1Row27 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 43 j

def largeInverse1Row28 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 44 j

def largeInverse1Row29 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 45 j

def largeInverse1Row30 (j : Fin 80) : ℤ :=
  (45) * largeBasis1 27 j + (-126) * largeBasis1 33 j + (81) * largeBasis1 38 j + (-45) * largeBasis1 46 j + (72) * largeBasis1 52 j + (-27) * largeBasis1 57 j

def largeInverse1Row31 (j : Fin 80) : ℤ :=
  (-216) * largeBasis1 0 j + (-216) * largeBasis1 1 j + (-36) * largeBasis1 2 j + (-216) * largeBasis1 3 j + (-216) * largeBasis1 4 j + (216) * largeBasis1 6 j + (216) * largeBasis1 7 j + (-72) * largeBasis1 8 j + (144) * largeBasis1 9 j + (216) * largeBasis1 10 j + (108) * largeBasis1 14 j + (72) * largeBasis1 15 j + (243) * largeBasis1 27 j + (288) * largeBasis1 28 j + (108) * largeBasis1 29 j + (288) * largeBasis1 30 j + (288) * largeBasis1 31 j + (-126) * largeBasis1 34 j + (-126) * largeBasis1 37 j + (-81) * largeBasis1 38 j + (-36) * largeBasis1 40 j + (-96) * largeBasis1 41 j + (-27) * largeBasis1 46 j + (-72) * largeBasis1 47 j + (-72) * largeBasis1 48 j + (-72) * largeBasis1 49 j + (-72) * largeBasis1 50 j + (-54) * largeBasis1 52 j + (18) * largeBasis1 53 j + (18) * largeBasis1 54 j + (-36) * largeBasis1 55 j + (18) * largeBasis1 56 j + (27) * largeBasis1 57 j + (24) * largeBasis1 60 j

def largeInverse1Row32 (j : Fin 80) : ℤ :=
  (-180) * largeBasis1 2 j + (288) * largeBasis1 8 j + (-108) * largeBasis1 14 j + (180) * largeBasis1 29 j + (-126) * largeBasis1 35 j + (36) * largeBasis1 40 j

def largeInverse1Row33 (j : Fin 80) : ℤ :=
  (72) * largeBasis1 9 j + (-72) * largeBasis1 15 j + (-126) * largeBasis1 36 j + (96) * largeBasis1 41 j + (54) * largeBasis1 55 j + (-24) * largeBasis1 60 j

def largeInverse1Row34 (_j : Fin 80) : ℤ :=
  0

def largeInverse1Row35 (j : Fin 80) : ℤ :=
  (-36) * largeBasis1 5 j + (36) * largeBasis1 11 j + (36) * largeBasis1 32 j

def largeInverse1Row36 (j : Fin 80) : ℤ :=
  (18) * largeBasis1 2 j + (-36) * largeBasis1 8 j + (18) * largeBasis1 14 j + (-18) * largeBasis1 29 j + (18) * largeBasis1 35 j + (-6) * largeBasis1 40 j

def largeInverse1Row37 (j : Fin 80) : ℤ :=
  (90) * largeBasis1 2 j + (-144) * largeBasis1 8 j + (54) * largeBasis1 14 j + (-90) * largeBasis1 29 j + (72) * largeBasis1 35 j + (-18) * largeBasis1 40 j

def largeInverse1Row38 (j : Fin 80) : ℤ :=
  (324) * largeBasis1 0 j + (378) * largeBasis1 1 j + (414) * largeBasis1 2 j + (324) * largeBasis1 3 j + (324) * largeBasis1 4 j + (-324) * largeBasis1 6 j + (-432) * largeBasis1 7 j + (-468) * largeBasis1 8 j + (-288) * largeBasis1 9 j + (-324) * largeBasis1 10 j + (54) * largeBasis1 13 j + (54) * largeBasis1 14 j + (-36) * largeBasis1 15 j + (-405) * largeBasis1 27 j + (-432) * largeBasis1 28 j + (-522) * largeBasis1 29 j + (-432) * largeBasis1 30 j + (-432) * largeBasis1 31 j + (162) * largeBasis1 33 j + (216) * largeBasis1 34 j + (306) * largeBasis1 35 j + (144) * largeBasis1 36 j + (216) * largeBasis1 37 j + (27) * largeBasis1 38 j + (-30) * largeBasis1 40 j + (48) * largeBasis1 41 j + (81) * largeBasis1 46 j + (54) * largeBasis1 47 j + (108) * largeBasis1 48 j + (108) * largeBasis1 49 j + (108) * largeBasis1 50 j + (-36) * largeBasis1 54 j + (-36) * largeBasis1 56 j + (-9) * largeBasis1 57 j + (-6) * largeBasis1 58 j + (4) * largeBasis1 59 j + (-12) * largeBasis1 60 j

def largeInverse1Row39 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 67 j

def largeInverse1Row40 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 72 j

def largeInverse1Row41 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 77 j

def largeInverse1Row42 (j : Fin 80) : ℤ :=
  (-180) * largeBasis1 2 j + (288) * largeBasis1 8 j + (-108) * largeBasis1 14 j + (144) * largeBasis1 29 j + (-144) * largeBasis1 35 j + (48) * largeBasis1 40 j + (36) * largeBasis1 48 j + (-4) * largeBasis1 59 j

def largeInverse1Row43 (j : Fin 80) : ℤ :=
  (-360) * largeBasis1 2 j + (576) * largeBasis1 8 j + (-216) * largeBasis1 14 j + (360) * largeBasis1 29 j + (-360) * largeBasis1 35 j + (120) * largeBasis1 40 j + (36) * largeBasis1 54 j + (-16) * largeBasis1 59 j

def largeInverse1Row44 (_j : Fin 80) : ℤ :=
  0

def largeInverse1Row45 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 62 j

def largeInverse1Row46 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 63 j

def largeInverse1Row47 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 64 j

def largeInverse1Row48 (j : Fin 80) : ℤ :=
  (27) * largeBasis1 27 j + (-54) * largeBasis1 33 j + (27) * largeBasis1 38 j + (-27) * largeBasis1 46 j + (36) * largeBasis1 52 j + (-9) * largeBasis1 57 j

def largeInverse1Row49 (j : Fin 80) : ℤ :=
  (54) * largeBasis1 1 j + (-108) * largeBasis1 7 j + (54) * largeBasis1 13 j + (-54) * largeBasis1 47 j + (36) * largeBasis1 53 j + (-6) * largeBasis1 58 j

def largeInverse1Row50 (j : Fin 80) : ℤ :=
  (-324) * largeBasis1 0 j + (-378) * largeBasis1 1 j + (-324) * largeBasis1 2 j + (-324) * largeBasis1 3 j + (-324) * largeBasis1 4 j + (324) * largeBasis1 6 j + (432) * largeBasis1 7 j + (324) * largeBasis1 8 j + (288) * largeBasis1 9 j + (324) * largeBasis1 10 j + (-54) * largeBasis1 13 j + (36) * largeBasis1 15 j + (405) * largeBasis1 27 j + (432) * largeBasis1 28 j + (432) * largeBasis1 29 j + (432) * largeBasis1 30 j + (432) * largeBasis1 31 j + (-162) * largeBasis1 33 j + (-216) * largeBasis1 34 j + (-216) * largeBasis1 35 j + (-144) * largeBasis1 36 j + (-216) * largeBasis1 37 j + (-27) * largeBasis1 38 j + (-48) * largeBasis1 41 j + (-81) * largeBasis1 46 j + (-54) * largeBasis1 47 j + (-108) * largeBasis1 48 j + (-108) * largeBasis1 49 j + (-108) * largeBasis1 50 j + (36) * largeBasis1 54 j + (36) * largeBasis1 56 j + (9) * largeBasis1 57 j + (6) * largeBasis1 58 j + (12) * largeBasis1 60 j

def largeInverse1Row51 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 9 j + (-36) * largeBasis1 15 j + (-72) * largeBasis1 36 j + (48) * largeBasis1 41 j + (36) * largeBasis1 55 j + (-12) * largeBasis1 60 j

def largeInverse1Row52 (_j : Fin 80) : ℤ :=
  0

def largeInverse1Row53 (j : Fin 80) : ℤ :=
  (-36) * largeBasis1 5 j + (36) * largeBasis1 11 j + (36) * largeBasis1 51 j

def largeInverse1Row54 (j : Fin 80) : ℤ :=
  (-162) * largeBasis1 0 j + (-108) * largeBasis1 1 j + (-72) * largeBasis1 2 j + (-126) * largeBasis1 3 j + (-162) * largeBasis1 4 j + (162) * largeBasis1 6 j + (54) * largeBasis1 7 j + (18) * largeBasis1 8 j + (-18) * largeBasis1 9 j + (162) * largeBasis1 10 j + (54) * largeBasis1 13 j + (54) * largeBasis1 14 j + (144) * largeBasis1 15 j + (243) * largeBasis1 27 j + (162) * largeBasis1 28 j + (108) * largeBasis1 29 j + (162) * largeBasis1 30 j + (162) * largeBasis1 31 j + (-243) * largeBasis1 33 j + (-81) * largeBasis1 34 j + (-27) * largeBasis1 35 j + (207) * largeBasis1 36 j + (-81) * largeBasis1 37 j + (81) * largeBasis1 38 j + (-18) * largeBasis1 40 j + (-192) * largeBasis1 41 j + (-81) * largeBasis1 46 j + (-54) * largeBasis1 47 j + (-36) * largeBasis1 48 j + (-36) * largeBasis1 49 j + (-36) * largeBasis1 50 j + (81) * largeBasis1 52 j + (27) * largeBasis1 53 j + (9) * largeBasis1 54 j + (-99) * largeBasis1 55 j + (9) * largeBasis1 56 j + (-27) * largeBasis1 57 j + (-6) * largeBasis1 58 j + (48) * largeBasis1 60 j

def largeInverse1Row55 (j : Fin 80) : ℤ :=
  (-162) * largeBasis1 0 j + (-108) * largeBasis1 1 j + (-72) * largeBasis1 2 j + (-162) * largeBasis1 3 j + (-162) * largeBasis1 4 j + (162) * largeBasis1 6 j + (54) * largeBasis1 7 j + (18) * largeBasis1 8 j + (90) * largeBasis1 9 j + (162) * largeBasis1 10 j + (54) * largeBasis1 13 j + (54) * largeBasis1 14 j + (72) * largeBasis1 15 j + (243) * largeBasis1 27 j + (162) * largeBasis1 28 j + (108) * largeBasis1 29 j + (198) * largeBasis1 30 j + (162) * largeBasis1 31 j + (-243) * largeBasis1 33 j + (-81) * largeBasis1 34 j + (-27) * largeBasis1 35 j + (45) * largeBasis1 36 j + (-81) * largeBasis1 37 j + (81) * largeBasis1 38 j + (-18) * largeBasis1 40 j + (-96) * largeBasis1 41 j + (-81) * largeBasis1 46 j + (-54) * largeBasis1 47 j + (-36) * largeBasis1 48 j + (-36) * largeBasis1 49 j + (-36) * largeBasis1 50 j + (81) * largeBasis1 52 j + (27) * largeBasis1 53 j + (9) * largeBasis1 54 j + (-45) * largeBasis1 55 j + (9) * largeBasis1 56 j + (-27) * largeBasis1 57 j + (-6) * largeBasis1 58 j + (24) * largeBasis1 60 j

def largeInverse1Row56 (j : Fin 80) : ℤ :=
  (-162) * largeBasis1 0 j + (-108) * largeBasis1 1 j + (-72) * largeBasis1 2 j + (-162) * largeBasis1 3 j + (-162) * largeBasis1 4 j + (162) * largeBasis1 6 j + (54) * largeBasis1 7 j + (18) * largeBasis1 8 j + (126) * largeBasis1 9 j + (162) * largeBasis1 10 j + (54) * largeBasis1 13 j + (54) * largeBasis1 14 j + (36) * largeBasis1 15 j + (243) * largeBasis1 27 j + (162) * largeBasis1 28 j + (108) * largeBasis1 29 j + (162) * largeBasis1 30 j + (162) * largeBasis1 31 j + (-243) * largeBasis1 33 j + (-81) * largeBasis1 34 j + (-27) * largeBasis1 35 j + (-9) * largeBasis1 36 j + (-81) * largeBasis1 37 j + (81) * largeBasis1 38 j + (-18) * largeBasis1 40 j + (-48) * largeBasis1 41 j + (-81) * largeBasis1 46 j + (-54) * largeBasis1 47 j + (-36) * largeBasis1 48 j + (-36) * largeBasis1 50 j + (81) * largeBasis1 52 j + (27) * largeBasis1 53 j + (9) * largeBasis1 54 j + (-27) * largeBasis1 55 j + (9) * largeBasis1 56 j + (-27) * largeBasis1 57 j + (-6) * largeBasis1 58 j + (12) * largeBasis1 60 j

def largeInverse1Row57 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 68 j

def largeInverse1Row58 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 73 j

def largeInverse1Row59 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 78 j

def largeInverse1Row60 (_j : Fin 80) : ℤ :=
  0

def largeInverse1Row61 (j : Fin 80) : ℤ :=
  (144) * largeBasis1 9 j + (-144) * largeBasis1 15 j + (-288) * largeBasis1 36 j + (192) * largeBasis1 41 j + (108) * largeBasis1 55 j + (-48) * largeBasis1 60 j

def largeInverse1Row62 (j : Fin 80) : ℤ :=
  (162) * largeBasis1 9 j + (-162) * largeBasis1 15 j + (-243) * largeBasis1 36 j + (162) * largeBasis1 41 j + (81) * largeBasis1 55 j + (-36) * largeBasis1 60 j

def largeInverse1Row63 (j : Fin 80) : ℤ :=
  (-36) * largeBasis1 19 j

def largeInverse1Row64 (j : Fin 80) : ℤ :=
  (-36) * largeBasis1 22 j

def largeInverse1Row65 (j : Fin 80) : ℤ :=
  (-36) * largeBasis1 25 j

def largeInverse1Row66 (j : Fin 80) : ℤ :=
  (-81) * largeBasis1 27 j + (162) * largeBasis1 33 j + (-81) * largeBasis1 38 j + (45) * largeBasis1 46 j + (-72) * largeBasis1 52 j + (27) * largeBasis1 57 j

def largeInverse1Row67 (j : Fin 80) : ℤ :=
  (-54) * largeBasis1 1 j + (108) * largeBasis1 7 j + (-54) * largeBasis1 13 j + (18) * largeBasis1 47 j + (-18) * largeBasis1 53 j + (6) * largeBasis1 58 j

def largeInverse1Row68 (j : Fin 80) : ℤ :=
  (-90) * largeBasis1 2 j + (144) * largeBasis1 8 j + (-54) * largeBasis1 14 j + (54) * largeBasis1 29 j + (-54) * largeBasis1 35 j + (18) * largeBasis1 40 j

def largeInverse1Row69 (j : Fin 80) : ℤ :=
  (-162) * largeBasis1 0 j + (-108) * largeBasis1 1 j + (-72) * largeBasis1 2 j + (-162) * largeBasis1 3 j + (-162) * largeBasis1 4 j + (162) * largeBasis1 6 j + (54) * largeBasis1 7 j + (18) * largeBasis1 8 j + (162) * largeBasis1 9 j + (162) * largeBasis1 10 j + (54) * largeBasis1 13 j + (54) * largeBasis1 14 j + (243) * largeBasis1 27 j + (162) * largeBasis1 28 j + (108) * largeBasis1 29 j + (162) * largeBasis1 30 j + (162) * largeBasis1 31 j + (-243) * largeBasis1 33 j + (-81) * largeBasis1 34 j + (-27) * largeBasis1 35 j + (-81) * largeBasis1 36 j + (-81) * largeBasis1 37 j + (81) * largeBasis1 38 j + (-18) * largeBasis1 40 j + (-81) * largeBasis1 46 j + (-54) * largeBasis1 47 j + (-36) * largeBasis1 48 j + (-36) * largeBasis1 49 j + (-36) * largeBasis1 50 j + (81) * largeBasis1 52 j + (27) * largeBasis1 53 j + (9) * largeBasis1 54 j + (9) * largeBasis1 55 j + (9) * largeBasis1 56 j + (-27) * largeBasis1 57 j + (-6) * largeBasis1 58 j

def largeInverse1Row70 (_j : Fin 80) : ℤ :=
  0

def largeInverse1Row71 (j : Fin 80) : ℤ :=
  (-36) * largeBasis1 5 j + (36) * largeBasis1 11 j

def largeInverse1Row72 (j : Fin 80) : ℤ :=
  (144) * largeBasis1 0 j + (162) * largeBasis1 1 j + (234) * largeBasis1 2 j + (144) * largeBasis1 3 j + (144) * largeBasis1 4 j + (-180) * largeBasis1 6 j + (-216) * largeBasis1 7 j + (-324) * largeBasis1 8 j + (-162) * largeBasis1 9 j + (-180) * largeBasis1 10 j + (36) * largeBasis1 12 j + (54) * largeBasis1 13 j + (90) * largeBasis1 14 j + (18) * largeBasis1 15 j + (36) * largeBasis1 16 j + (-177) * largeBasis1 27 j + (-192) * largeBasis1 28 j + (-282) * largeBasis1 29 j + (-192) * largeBasis1 30 j + (-192) * largeBasis1 31 j + (66) * largeBasis1 33 j + (96) * largeBasis1 34 j + (186) * largeBasis1 35 j + (51) * largeBasis1 36 j + (96) * largeBasis1 37 j + (15) * largeBasis1 38 j + (-30) * largeBasis1 40 j + (30) * largeBasis1 41 j + (33) * largeBasis1 46 j + (30) * largeBasis1 47 j + (48) * largeBasis1 48 j + (48) * largeBasis1 49 j + (48) * largeBasis1 50 j + (12) * largeBasis1 52 j + (6) * largeBasis1 53 j + (-12) * largeBasis1 54 j + (15) * largeBasis1 55 j + (-12) * largeBasis1 56 j + (-9) * largeBasis1 57 j + (-6) * largeBasis1 58 j + (-12) * largeBasis1 60 j

def largeInverse1Row73 (j : Fin 80) : ℤ :=
  (648) * largeBasis1 0 j + (702) * largeBasis1 1 j + (918) * largeBasis1 2 j + (648) * largeBasis1 3 j + (648) * largeBasis1 4 j + (-648) * largeBasis1 6 j + (-756) * largeBasis1 7 j + (-1080) * largeBasis1 8 j + (-594) * largeBasis1 9 j + (-648) * largeBasis1 10 j + (54) * largeBasis1 13 j + (162) * largeBasis1 14 j + (-54) * largeBasis1 15 j + (-819) * largeBasis1 27 j + (-864) * largeBasis1 28 j + (-1134) * largeBasis1 29 j + (-864) * largeBasis1 30 j + (-864) * largeBasis1 31 j + (288) * largeBasis1 33 j + (378) * largeBasis1 34 j + (648) * largeBasis1 35 j + (243) * largeBasis1 36 j + (378) * largeBasis1 37 j + (81) * largeBasis1 38 j + (36) * largeBasis1 39 j + (-54) * largeBasis1 40 j + (126) * largeBasis1 41 j + (36) * largeBasis1 42 j + (171) * largeBasis1 46 j + (162) * largeBasis1 47 j + (216) * largeBasis1 48 j + (216) * largeBasis1 49 j + (216) * largeBasis1 50 j + (18) * largeBasis1 52 j + (-54) * largeBasis1 54 j + (27) * largeBasis1 55 j + (-54) * largeBasis1 56 j + (-27) * largeBasis1 57 j + (-18) * largeBasis1 58 j + (-36) * largeBasis1 60 j

def largeInverse1Row74 (j : Fin 80) : ℤ :=
  (2916) * largeBasis1 0 j + (3078) * largeBasis1 1 j + (3726) * largeBasis1 2 j + (2916) * largeBasis1 3 j + (2916) * largeBasis1 4 j + (-2916) * largeBasis1 6 j + (-3240) * largeBasis1 7 j + (-4212) * largeBasis1 8 j + (-2754) * largeBasis1 9 j + (-2916) * largeBasis1 10 j + (162) * largeBasis1 13 j + (486) * largeBasis1 14 j + (-162) * largeBasis1 15 j + (-3753) * largeBasis1 27 j + (-3888) * largeBasis1 28 j + (-4698) * largeBasis1 29 j + (-3888) * largeBasis1 30 j + (-3888) * largeBasis1 31 j + (1674) * largeBasis1 33 j + (1944) * largeBasis1 34 j + (2754) * largeBasis1 35 j + (1539) * largeBasis1 36 j + (1944) * largeBasis1 37 j + (135) * largeBasis1 38 j + (-270) * largeBasis1 40 j + (270) * largeBasis1 41 j + (837) * largeBasis1 46 j + (810) * largeBasis1 47 j + (972) * largeBasis1 48 j + (972) * largeBasis1 49 j + (972) * largeBasis1 50 j + (-108) * largeBasis1 52 j + (-162) * largeBasis1 53 j + (-324) * largeBasis1 54 j + (-81) * largeBasis1 55 j + (-324) * largeBasis1 56 j + (-45) * largeBasis1 57 j + (-18) * largeBasis1 58 j + (36) * largeBasis1 59 j + (-72) * largeBasis1 60 j + (36) * largeBasis1 61 j

def largeInverse1Row75 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 65 j + (108) * largeBasis1 66 j + (324) * largeBasis1 67 j + (36) * largeBasis1 69 j

def largeInverse1Row76 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 70 j + (108) * largeBasis1 71 j + (324) * largeBasis1 72 j + (36) * largeBasis1 74 j

def largeInverse1Row77 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 75 j + (108) * largeBasis1 76 j + (324) * largeBasis1 77 j + (36) * largeBasis1 79 j

def largeInverse1Row78 (j : Fin 80) : ℤ :=
  (18) * largeBasis1 0 j + (18) * largeBasis1 1 j + (18) * largeBasis1 2 j + (18) * largeBasis1 3 j + (18) * largeBasis1 4 j + (-18) * largeBasis1 6 j + (-18) * largeBasis1 7 j + (-18) * largeBasis1 8 j + (-18) * largeBasis1 9 j + (-18) * largeBasis1 10 j + (-30) * largeBasis1 27 j + (-30) * largeBasis1 28 j + (-30) * largeBasis1 29 j + (-30) * largeBasis1 30 j + (-30) * largeBasis1 31 j + (15) * largeBasis1 33 j + (15) * largeBasis1 34 j + (15) * largeBasis1 35 j + (15) * largeBasis1 36 j + (15) * largeBasis1 37 j + (12) * largeBasis1 46 j + (12) * largeBasis1 47 j + (12) * largeBasis1 48 j + (12) * largeBasis1 49 j + (12) * largeBasis1 50 j + (-3) * largeBasis1 52 j + (-3) * largeBasis1 53 j + (-3) * largeBasis1 54 j + (-3) * largeBasis1 55 j + (-3) * largeBasis1 56 j

def largeInverse1Row79 (j : Fin 80) : ℤ :=
  (144) * largeBasis1 0 j + (144) * largeBasis1 1 j + (144) * largeBasis1 2 j + (144) * largeBasis1 3 j + (144) * largeBasis1 4 j + (-144) * largeBasis1 6 j + (-144) * largeBasis1 7 j + (-144) * largeBasis1 8 j + (-144) * largeBasis1 9 j + (-144) * largeBasis1 10 j + (-192) * largeBasis1 27 j + (-192) * largeBasis1 28 j + (-192) * largeBasis1 29 j + (-192) * largeBasis1 30 j + (-192) * largeBasis1 31 j + (96) * largeBasis1 33 j + (96) * largeBasis1 34 j + (96) * largeBasis1 35 j + (96) * largeBasis1 36 j + (96) * largeBasis1 37 j + (48) * largeBasis1 46 j + (48) * largeBasis1 47 j + (48) * largeBasis1 48 j + (48) * largeBasis1 49 j + (48) * largeBasis1 50 j + (-12) * largeBasis1 52 j + (-12) * largeBasis1 53 j + (-12) * largeBasis1 54 j + (-12) * largeBasis1 55 j + (-12) * largeBasis1 56 j

def largeInverse1Row80 (_j : Fin 80) : ℤ :=
  0

def largeInverse1Row81 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 18 j + (36) * largeBasis1 19 j + (36) * largeBasis1 20 j

def largeInverse1Row82 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 21 j + (36) * largeBasis1 22 j + (36) * largeBasis1 23 j

def largeInverse1Row83 (j : Fin 80) : ℤ :=
  (36) * largeBasis1 24 j + (36) * largeBasis1 25 j + (36) * largeBasis1 26 j

def largeInverse1Row84 (j : Fin 80) : ℤ :=
  (-15) * largeBasis1 27 j + (30) * largeBasis1 33 j + (-15) * largeBasis1 38 j + (15) * largeBasis1 46 j + (-24) * largeBasis1 52 j + (9) * largeBasis1 57 j

def largeInverse1Row85 (j : Fin 80) : ℤ :=
  (-18) * largeBasis1 1 j + (36) * largeBasis1 7 j + (-18) * largeBasis1 13 j + (18) * largeBasis1 47 j + (-18) * largeBasis1 53 j + (6) * largeBasis1 58 j

def largeInverse1Row86 (j : Fin 80) : ℤ :=
  (-90) * largeBasis1 2 j + (144) * largeBasis1 8 j + (-54) * largeBasis1 14 j + (90) * largeBasis1 29 j + (-90) * largeBasis1 35 j + (30) * largeBasis1 40 j

def largeInverse1Row87 (j : Fin 80) : ℤ :=
  (-18) * largeBasis1 9 j + (18) * largeBasis1 15 j + (45) * largeBasis1 36 j + (-30) * largeBasis1 41 j + (-27) * largeBasis1 55 j + (12) * largeBasis1 60 j

def largeInverse1Row88 (_j : Fin 80) : ℤ :=
  0

def largeInverse1Row89 (j : Fin 80) : ℤ :=
  (-36) * largeBasis1 11 j + (36) * largeBasis1 17 j

def largeInverse1 : Matrix (Param 6 6 6) (Fin 80) ℤ :=
  fun p => match p.2 with
  | Sum.inl i => ![![largeInverse1Row00, largeInverse1Row01, largeInverse1Row02, largeInverse1Row03, largeInverse1Row04, largeInverse1Row05], ![largeInverse1Row18, largeInverse1Row19, largeInverse1Row20, largeInverse1Row21, largeInverse1Row22, largeInverse1Row23], ![largeInverse1Row36, largeInverse1Row37, largeInverse1Row38, largeInverse1Row39, largeInverse1Row40, largeInverse1Row41], ![largeInverse1Row54, largeInverse1Row55, largeInverse1Row56, largeInverse1Row57, largeInverse1Row58, largeInverse1Row59], ![largeInverse1Row72, largeInverse1Row73, largeInverse1Row74, largeInverse1Row75, largeInverse1Row76, largeInverse1Row77]] p.1 i
  | Sum.inr (Sum.inl i) => ![![largeInverse1Row06, largeInverse1Row07, largeInverse1Row08, largeInverse1Row09, largeInverse1Row10, largeInverse1Row11], ![largeInverse1Row24, largeInverse1Row25, largeInverse1Row26, largeInverse1Row27, largeInverse1Row28, largeInverse1Row29], ![largeInverse1Row42, largeInverse1Row43, largeInverse1Row44, largeInverse1Row45, largeInverse1Row46, largeInverse1Row47], ![largeInverse1Row60, largeInverse1Row61, largeInverse1Row62, largeInverse1Row63, largeInverse1Row64, largeInverse1Row65], ![largeInverse1Row78, largeInverse1Row79, largeInverse1Row80, largeInverse1Row81, largeInverse1Row82, largeInverse1Row83]] p.1 i
  | Sum.inr (Sum.inr i) => ![![largeInverse1Row12, largeInverse1Row13, largeInverse1Row14, largeInverse1Row15, largeInverse1Row16, largeInverse1Row17], ![largeInverse1Row30, largeInverse1Row31, largeInverse1Row32, largeInverse1Row33, largeInverse1Row34, largeInverse1Row35], ![largeInverse1Row48, largeInverse1Row49, largeInverse1Row50, largeInverse1Row51, largeInverse1Row52, largeInverse1Row53], ![largeInverse1Row66, largeInverse1Row67, largeInverse1Row68, largeInverse1Row69, largeInverse1Row70, largeInverse1Row71], ![largeInverse1Row84, largeInverse1Row85, largeInverse1Row86, largeInverse1Row87, largeInverse1Row88, largeInverse1Row89]] p.1 i

end TR25
