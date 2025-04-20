class_name JumpInput

var wants_jump: bool
var jump_released: bool

func _init(wants_jump_i = false, jump_released_i = false) -> void:
	wants_jump = wants_jump_i
	jump_released = jump_released_i
		
