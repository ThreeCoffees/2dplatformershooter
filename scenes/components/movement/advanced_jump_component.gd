class_name AdvancedJumpComponent
extends JumpComponent

@export_range(0,1) var jump_cutoff: float = 0.8
@export var coyote_time: float = 0.08
@export var jump_buffer: float = 0.08

@export var jump_buffer_timer: Timer
@export var coyote_time_timer: Timer

func _ready() -> void:
	jump_buffer_timer.wait_time = jump_buffer
	coyote_time_timer.wait_time = coyote_time
	
func can_jump(body: CharacterBody2D) -> bool:
	return body.is_on_floor() or not coyote_time_timer.is_stopped()

func handle_jump(body: CharacterBody2D, jump_input: JumpInput) -> void:
	handle_basic_jump(body, jump_input)
	
	handle_coyote_time(body)
	handle_jump_buffer(body, jump_input.wants_jump)
	handle_variable_jump_height(body, jump_input.jump_released)
	
	update_vars_after_jump(body)
	
func handle_variable_jump_height(body: CharacterBody2D, jump_released: bool) -> void:
	if jump_released and is_jumping:
		body.velocity.y *= jump_cutoff
		
func handle_jump_buffer(body: CharacterBody2D, wants_jump: bool) -> void:
	if wants_jump and not body.is_on_floor():
		jump_buffer_timer.start()
		
	if body.is_on_floor() and not jump_buffer_timer.is_stopped():
		jump(body)

func handle_coyote_time(body: CharacterBody2D) -> void:
	if has_just_stepped_off_ledge(body):
		coyote_time_timer.start()
	
	if not coyote_time_timer.is_stopped() and not is_jumping:
		body.velocity.y = 0

func jump(body: CharacterBody2D) -> void:
	super(body)
	coyote_time_timer.stop()
	jump_buffer_timer.stop()
	
