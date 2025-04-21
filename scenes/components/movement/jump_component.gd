class_name JumpComponent
extends Node
## Component containing the basic jump logic.
## 
## Allows a [class CharacterBody2D] to jump with a constant height
## To use call [method JumpComponent.handle_jump]


@export var jump_velocity: float = -400

var is_jumping: bool = false
var is_going_up: bool = false
var last_frame_on_floor: bool = false

func has_just_landed(body: CharacterBody2D) -> bool:
	return body.is_on_floor() and not last_frame_on_floor and is_jumping
	
func has_just_stepped_off_ledge(body: CharacterBody2D) -> bool:
	return not body.is_on_floor() and last_frame_on_floor and not is_jumping
	
func can_jump(body: CharacterBody2D) -> bool:
	return body.is_on_floor()

## Function handling the jump logic.
##
## [param body] 		- body that the jump will be applied to
## [param jump_input] 	- input controlling the jump. Can be from a player or AI controller
func handle_jump(body: CharacterBody2D, jump_input: JumpInput) -> void:
	handle_basic_jump(body, jump_input)
	update_vars_after_jump(body)

func handle_basic_jump(body: CharacterBody2D, jump_input: JumpInput) -> void:
	if has_just_landed(body):
		is_jumping = false
		
	if jump_input.wants_jump and can_jump(body):
		jump(body)

func update_vars_after_jump(body: CharacterBody2D) -> void:
	is_going_up = body.velocity.y < 0 and not body.is_on_floor()
	last_frame_on_floor = body.is_on_floor()

func jump(body: CharacterBody2D) -> void:
	body.velocity.y = jump_velocity
	is_jumping = true
