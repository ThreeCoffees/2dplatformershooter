class_name AimComponent
extends Node
## Component handling aiming

func handle_aim(hand: Node2D, aim_point: Vector2) -> void:
	hand.look_at(aim_point)
	
