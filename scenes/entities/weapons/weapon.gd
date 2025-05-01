extends Node2D
class_name Weapon

func _on_body_entered(body: Node2D) -> void:
	print("aa")
	if body is Player:
		body.equip_weapon(self)

func _process(delta: float) -> void:
	pass
	
