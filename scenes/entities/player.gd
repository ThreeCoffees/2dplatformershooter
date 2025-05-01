class_name Player
extends CharacterBody2D

@export_category("Nodes")
@export var gravity_component: GravityComponent
@export var input_component: InputComponent
@export var movement_component: MovementComponent
@export var jump_component: JumpComponent
@export var wall_jump_component: WallJumpComponent
@export var animation_component: AnimationComponent
@export var aim_component: AimComponent

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	gravity_component.handle_gravity(self, delta)
	movement_component.handle_horizontal_movement(self, input_component.input_horizontal)
	jump_component.handle_jump(self, input_component.get_jump_input())
	wall_jump_component.handle_wall_jump(self, input_component.get_jump_input())
	aim_component.handle_aim(self, input_component.get_aim_point())

	animation_component.handle_move_animation(input_component.input_horizontal)
	animation_component.handle_jump_animation(jump_component.is_jumping, !jump_component.is_going_up)
	# animation_component.handle_aim_animation(input_component.get_aim_point())
	move_and_slide()
	
func equip_weapon(weapon: Weapon):
	weapon.get_parent().remove_child(weapon)
	get_node("HandPivot/Hand").add_child(weapon)
	
	weapon.position = Vector2.ZERO
