extends Node

@onready var piece: Node = $"../Piece"

@export var startPosFEN = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"

var squares = []

func _init() -> void:
	# 0 initialise board	
	squares.resize(64)
	squares.fill(0)

func _ready() -> void:
	PositionFromFEN() # load start position from FEN

func PositionFromFEN(FEN: String = startPosFEN):
	var selections = FEN.split(" ")
	var file = 0;
	var rank = 7;
	for symbol in selections[0]:
		if symbol == '/':
			file = 0
			rank -= 1
		else:
			if symbol.is_valid_int():
				file += symbol.to_int()
			else:
				var pieceColor = piece.black if (symbol == symbol.to_upper()) else piece.white
				var pieceType = 0
				match symbol.to_lower():
					'k': pieceType = piece.king
					'p': pieceType = piece.pawn
					'n': pieceType = piece.knight
					'b': pieceType = piece.bishop
					'r': pieceType = piece.rook
					'q': pieceType = piece.queen
					_:   pieceType = piece.none
				
				print(pieceType)
				
				squares[file * 8 + rank] = pieceType + pieceColor
				file += 1
