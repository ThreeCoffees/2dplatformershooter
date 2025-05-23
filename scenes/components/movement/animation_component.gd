class_name AnimationComponent
extends Node
## Component handling animations

@export var sprite: AnimatedSprite2D

func handle_horizontal_flip(move_direction: float) -> void:
	if move_direction == 0:
		return
	sprite.flip_h = move_direction < 0


func handle_move_animation(move_direction: float) -> void:
	handle_horizontal_flip(move_direction)

	if move_direction != 0:
		sprite.play("run")
		pass
	else:
		sprite.play("idle")

func handle_jump_animation(is_jumping: bool, is_falling: bool) -> void:
	if is_jumping:
		sprite.play("jump")
	elif is_falling:
		sprite.play("fall")
