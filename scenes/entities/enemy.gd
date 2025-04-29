class_name Enemy
extends CharacterBody2D

@export_category("Nodes")
@export var gravity_component: GravityComponent
@export var ai_component: AIComponent
@export var animation_component: AnimationComponent

func _physics_process(delta: float) -> void:
	gravity_component.handle_gravity(self, delta)

	animation_component.handle_move_animation(1.0) # TODO: take direciton from where they're aiming
	animation_component.handle_jump_animation(false, !is_on_floor())

	move_and_slide()
