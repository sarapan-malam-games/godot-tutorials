extends Area2D
class_name Grass

@export var min_skew: float = -300.0
@export var max_skew: float = 300.0

func _ready():
	randomize()
	%Sprite2d.frame = randi() % 3
