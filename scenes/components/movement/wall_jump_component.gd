class_name WallJumpComponent
extends Node
## Component handling wall jumping

@export var raycast_left: RayCast2D
@export var raycast_right: RayCast2D
@export var wall_jump_velocity: float = -400.0
@export var wall_jump_pushback: float = 200.0

func handle_wall_jump(body: CharacterBody2D, jump_input: JumpInput) -> void:
	if jump_input.wants_jump and can_wall_jump(body):
		wall_jump(body)

func can_wall_jump(body: CharacterBody2D) -> bool:
	return !body.is_on_floor() and (raycast_left.is_colliding() or raycast_right.is_colliding())

func wall_jump(body: CharacterBody2D) -> void:
	body.velocity.y = wall_jump_velocity
	body.velocity.x = wall_jump_pushback * get_direction()

func get_direction() -> int:
	if raycast_left.is_colliding():
		return 1
	elif raycast_right.is_colliding():
		return -1
	return 0
