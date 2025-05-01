class_name InputComponent
extends Node
## Component taking input from the player and converting it for use in other components

var input_horizontal: float = 0
	
func _process(_delta: float) -> void:
	input_horizontal = Input.get_axis("move_left", "move_right")

func get_jump_input() -> JumpInput:
	return JumpInput.new(Input.is_action_just_pressed("jump"), Input.is_action_just_released("jump"))
	
func get_aim_point() -> Vector2:
	return get_viewport().get_camera_2d().get_global_mouse_position()
