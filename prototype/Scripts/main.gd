extends Node2D

@onready var piece: Node = $Piece
@onready var board: Node = $Board
const BASE_WOOD_1 = preload("res://Assets/sbs_-_2d_chess_pack/Top Down/Boards/Bases/Base - Wood 1 512x544.png")
const BASE_WOOD_2 = preload("res://Assets/sbs_-_2d_chess_pack/Top Down/Boards/Bases/Base - Wood 2 512x544.png")

const piece_spriteframes = preload("res://Assets/piece_spriteframes.tres")

var size = 96.0
var dx = 80.0
var dy = 80.0

func DrawPieces():

	for i in board.squares.size():
		var file: int = i / 8 # gets automatically floored by conversion to int
		var rank: int = i % 8

		var boundingBox = Rect2((file - 0.5) * size + dx, (rank - 0.9) * size + dy, size * 2, size * 2)
		match board.squares[i]:
			0:
				continue
			9, 10, 11, 12, 13, 14, 15: # White Pieces
				var texture = piece_spriteframes.get_frame_texture("white", board.squares[i] - piece.white)
				draw_texture_rect(texture, boundingBox, false)
			17, 18, 19, 20, 21, 22, 23: # Black Pieces
				var texture = piece_spriteframes.get_frame_texture("black", board.squares[i] - piece.black)
				draw_texture_rect(texture, boundingBox, false)


func DrawBoard():
	for file in range(8):
		for rank in range(8):
			var isLightSquare: bool = ((rank + file) % 2 == 1)
			var squareTexture: Texture2D = BASE_WOOD_2 if isLightSquare else BASE_WOOD_1
			var square = Rect2(file * size + dx, rank * size + dy, size, size)
			draw_texture_rect(squareTexture,square, true)

func _draw() -> void:
	DrawBoard()
	DrawPieces()
