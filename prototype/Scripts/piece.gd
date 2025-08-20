extends Node

# 3 bits zum Unterscheiden der Figfur
const none: int   = 0x00
const king: int   = 0x01
const pawn: int   = 0x02
const bishop: int = 0x03
const knight: int = 0x04
const rook: int   = 0x05
const queen: int  = 0x06

# 2 bits für Farben (3. "Farbe" ist für Leeres Feld)
const white: int   = 0x08
const black: int   = 0x10 # 16

# eg. 01 001 == Weißer König
#      |   |
#      |   1 = König
#      0b1000 = 8 = Weiß

#     10 010 == Schwarzer Bauer
#     00 000 == Leeres Feld
