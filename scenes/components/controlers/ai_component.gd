class_name AIComponent
extends Node

@export_range(-1,1,2) var initial_direction: float = -1
@export var left_raycast: RayCast2D
@export var right_raycast: RayCast2D

var input_horizontal: float = 0

func _ready() -> void:
	input_horizontal = initial_direction
	
func _process(_delta: float) -> void:
	if !left_raycast == null and left_raycast.is_colliding():
		input_horizontal = 1
	elif !right_raycast == null and right_raycast.is_colliding():
		input_horizontal = -1

func get_jump_input() -> JumpInput:
	return JumpInput.new()
	
