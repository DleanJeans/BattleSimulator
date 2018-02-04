extends Area2D

onready var warrior = get_parent()

func _on_area_entered(weapon):
	if _weapon_is_from_enemy(weapon):
		warrior.emit_signal("hit", warrior, weapon.damage)

func _weapon_is_from_enemy(weapon):
	var weapon_owner = weapon.get_parent().get_parent()
	
	return warrior != weapon_owner