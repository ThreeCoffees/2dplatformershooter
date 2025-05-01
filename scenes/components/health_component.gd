@tool
class_name HealthComponent
extends Node

signal health_changed(old_value: float, new_value: float)
signal max_health_changed(old_value: float, new_value: float)
signal health_depleted

@export var max_health: float = 100.0 : set = _set_max_health, get = _get_max_health
var health: float : set = _set_health, get = _get_health

func _ready() -> void:
	health = max_health
	
func change_health_by(value: float) -> void:
	_set_health(health + value)
	
func change_max_health_by(value: float) -> void:
	_set_max_health(max_health + value)
	
func _set_health(new_value) -> void:
	var old_value = health
	health = new_value
	if health <= 0:
		health = 0
		health_depleted.emit()
	elif health > max_health:
		health = max_health
	health_changed.emit(old_value, health)

func _get_health() -> float:
	return health
	
func _set_max_health(new_value) -> void:
	var old_value = max_health
	max_health = new_value
	if max_health <= 0:
		max_health = 0
		health_depleted.emit()
	if max_health > health:
		health = max_health;
	max_health_changed.emit(old_value, max_health)
	
func _get_max_health() -> float:
	return max_health
	
