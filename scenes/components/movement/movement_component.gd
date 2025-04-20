class_name MovementComponent
extends Node

@export var speed: float = 100
@export_range(0,1) var ground_acceleration: float = 0.3
@export_range(0,1) var ground_deceleration: float = 0.3
@export_range(0,1) var air_acceleration: float = 0.1
@export_range(0,1) var air_deceleration: float = 0.1

func handle_horizontal_movement(body: CharacterBody2D, direction: float) -> void:
	if body.is_on_floor():
		if direction != 0:
			body.velocity.x = move_toward(body.velocity.x, direction * speed, speed * ground_acceleration)
		else:
			body.velocity.x = move_toward(body.velocity.x, 0, speed * ground_deceleration)
	else:
		if direction != 0:
			body.velocity.x = move_toward(body.velocity.x, direction * speed, speed * air_acceleration)
		else:
			body.velocity.x = move_toward(body.velocity.x, 0, speed * air_deceleration)
		
