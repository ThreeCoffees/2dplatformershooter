class_name Weapon
extends Node2D

func _on_body_entered(body: Node2D) -> void:
	print("aa")
	if body is Player:
		body.equip_weapon(self)

func _process(delta: float) -> void:
	pass
	
