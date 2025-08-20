extends Node

@onready var piece: Node = $"../Piece"

var squares = []

func _init() -> void:
	# 0 initialise board	
	squares.resize(64)
	squares.fill(0)
	
func _ready() -> void:
	squares.set(0, piece.king + piece.white)
