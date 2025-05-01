@tool
class_name HealthBar
extends ProgressBar

@export var health_component: HealthComponent

func _ready() -> void:
	max_value = health_component.max_health
	value = health_component.health
	if !health_component.health_changed.is_connected(_on_health_component_health_changed):
		health_component.health_changed.connect(_on_health_component_health_changed)
	if !health_component.max_health_changed.is_connected(_on_health_component_max_health_changed):
		health_component.max_health_changed.connect(_on_health_component_max_health_changed)

func _on_health_component_max_health_changed(old_value: float, new_value: float) -> void:
	max_value = new_value
	value = health_component.health


func _on_health_component_health_changed(old_value: float, new_value: float) -> void:
	value = new_value
	

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = []
	if health_component == null:
		warnings.append("HealthBar needs to have a HealthComponent assigned to it.")
	return warnings
