extends CharacterBody2D

@export var movespeed := 10000.0
@export var jump_force := 1000.0
@export var gravity := 3000.0
@export var direction := 0.0

@export var acceleration := 15.0
@export var decceleration := 20.0


func _physics_process(delta: float) -> void:
	move_and_slide()
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	direction = Input.get_axis("move_left", "move_right")
	velocity.x = (movespeed * direction) * delta
	
	if direction:
		$Sprite2d.flip_h = direction <= 0.0
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force

