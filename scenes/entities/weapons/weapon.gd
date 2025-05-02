class_name Weapon
extends Node2D

@export var bullets_per_second = 2

var bullet_rate_timer: Timer
var firing_cooldown = 1.0/bullets_per_second
var firing = false
var ready_to_fire = true

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.equip_weapon(self)

func _enter_tree() -> void:
	bullet_rate_timer = get_node("BulletRateTimer")
	bullet_rate_timer.one_shot = true

func _process(delta: float) -> void:
	pass

func try_firing():
	if not bullet_rate_timer.is_stopped(): 
		return
	else:
		fire()
		bullet_rate_timer.start(firing_cooldown)

func fire():
	print("shoot")
