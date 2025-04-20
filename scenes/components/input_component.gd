class_name InputComponent
extends Node

var input_horizontal: float = 0
	
func _process(_delta: float) -> void:
	input_horizontal = Input.get_axis("move_left", "move_right")

func get_jump_input() -> JumpInput:
	return JumpInput.new(Input.is_action_just_pressed("jump"), Input.is_action_just_released("jump"))
	
