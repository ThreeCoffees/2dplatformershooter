class_name Player
extends CharacterBody2D

@export_category("Nodes")
@export var gravity_component: GravityComponent
@export var input_component: InputComponent
@export var movement_component: MovementComponent
@export var jump_component: JumpComponent
@export var wall_jump_component: WallJumpComponent
@export var animation_component: AnimationComponent

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	gravity_component.handle_gravity(self, delta)
	movement_component.handle_horizontal_movement(self, input_component.input_horizontal)
	jump_component.handle_jump(self, input_component.get_jump_input())
	wall_jump_component.handle_wall_jump(self, input_component.get_jump_input())

	animation_component.handle_move_animation(input_component.input_horizontal)
	animation_component.handle_jump_animation(jump_component.is_jumping, !jump_component.is_going_up)

	move_and_slide()


func _on_health_component_health_depleted() -> void:
	print("Player died")


func _on_hurt_box_knockback_received(knockback_force: Vector2) -> void:
	velocity = knockback_force
