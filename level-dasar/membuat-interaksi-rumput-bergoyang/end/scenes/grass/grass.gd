extends Area2D
class_name Grass

@export var min_skew: float = -300.0
@export var max_skew: float = 300.0

func _ready():
	randomize()
	%Sprite2d.frame = randi() % 3
	
	%Sprite2d.material.set_shader_parameter("offset", randi() % 3)
	connect("body_entered", _on_sway)
	connect("body_exited", _on_sway)


func _on_sway(body: Node2D) -> void:
	if body is Player:
		var direction = global_position.direction_to(body.global_position)
		var skew = clamp(remap(body.velocity.length() * sign(-direction.x), -body.SPEED, body.SPEED, min_skew, max_skew), min_skew, max_skew)
			
		var tween = create_tween()
		tween.tween_property(%Sprite2d.material, "skew", skew, 0.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(%Sprite2d.material, "skew", 0.0, 2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
