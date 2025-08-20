extends Node2D

@onready var piece: Node = $Piece
@onready var board: Node = $Board
const BASE_WOOD_1 = preload("res://Assets/sbs_-_2d_chess_pack/Top Down/Boards/Bases/Base - Wood 1 512x544.png")
const BASE_WOOD_2 = preload("res://Assets/sbs_-_2d_chess_pack/Top Down/Boards/Bases/Base - Wood 2 512x544.png")
var size = 100.0

func DrawPieces():
	printerr("TODO")

func DrawBoard():
	for file in range(8):
		for rank in range(8):
			var isLightSquare: bool = ((rank + file) % 2 == 1)
			var squareTexture: Texture2D = BASE_WOOD_2 if isLightSquare else BASE_WOOD_1
			var square = Rect2(file * size, rank * size, size, size)
			draw_texture_rect(squareTexture,square, true)

func _draw() -> void:
	DrawBoard()
	DrawPieces()
