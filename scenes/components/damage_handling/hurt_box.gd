@tool
class_name HurtBox
extends Area2D
## Component that marks a certain area as capable of being damaged

@export var health_component: HealthComponent

func _on_area_entered(area: Area2D) -> void:
	if Engine.is_editor_hint():
		return

	var hitbox = area as HitBox
	if hitbox != null:
		health_component.change_health_by(hitbox.health_change)

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = []
	if health_component == null:
		warnings.append("HurtBox needs to have a HealthComponent assigned to it.")
	return warnings
