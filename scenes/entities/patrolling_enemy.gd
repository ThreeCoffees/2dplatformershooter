class_name PatrollingEnemy
extends Enemy

@export_category("Nodes")
@export var movement_component: MovementComponent

func _physics_process(delta: float) -> void:
	gravity_component.handle_gravity(self, delta)
	movement_component.handle_horizontal_movement(self, ai_component.input_horizontal)

	animation_component.handle_move_animation(ai_component.input_horizontal)
	animation_component.handle_jump_animation(false, !is_on_floor())

	move_and_slide()
