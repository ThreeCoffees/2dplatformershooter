@tool
class_name HealthBar
extends ProgressBar

@export var health_component: HealthComponent

func _ready() -> void:
	max_value = health_component.max_health
	value = health_component.health


func _on_health_component_max_health_changed(old_value: float, new_value: float) -> void:
	max_value = new_value
	value = health_component.health


func _on_health_component_health_changed(old_value: float, new_value: float) -> void:
	value = new_value
