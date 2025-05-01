class_name FireComponent
extends Node

func handle_fire(player: Player, input: FireInput):
	var weapon: Weapon = player.get_equipped_weapon()
	if weapon == null: return
	if input.wants_fire:
		weapon.try_firing()
