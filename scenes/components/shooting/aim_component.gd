class_name AimComponent
extends Node
## Component handling aiming

var pivot: Node2D

#func _enter_tree() -> void:
	#pivot = get_parent().get_node("HandPivot")
	
func handle_aim(player: CharacterBody2D, aim_point: Vector2) -> void:
	player.get_node("HandPivot").look_at(aim_point)
