@tool
class_name Enemy
extends CharacterBody2D

@export_category("Nodes")
@export var gravity_component: GravityComponent
@export var movement_ai_component: Node
@export var animation_component: AnimationComponent
@export var movement_component: MovementComponent

func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint():
		return
	gravity_component.handle_gravity(self, delta)
	movement_component.handle_horizontal_movement(self, movement_ai_component.input_horizontal)

	animation_component.handle_move_animation(movement_ai_component.get_direction())
	animation_component.handle_jump_animation(false, !is_on_floor())

	move_and_slide()
	

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = []
	if gravity_component == null:
		warnings.append("Enemy needs a gravity component")
	if movement_ai_component == null:
		warnings.append("Enemy needs a movement ai component")
	if animation_component == null:
		warnings.append("Enemy needs an animation component")
	if movement_component == null:
		warnings.append("Enemy needs a movement component")
	return warnings


func _on_health_component_health_depleted() -> void:
	print("Enemy died")

