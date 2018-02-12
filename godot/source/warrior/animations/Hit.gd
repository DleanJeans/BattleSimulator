extends "res://source/warrior/animations/AnimationPlayer.gd"

func _on_Warrior_got_hit(weapon):
	play("Hit")
	var weapon_owner = weapon.get_parent().get_parent()
	var weapon_owner_is_player = weapon_owner.is_player()
	var self_is_player = warrior.is_player()
	
	var both_are_not_player = not weapon_owner_is_player and not self_is_player
	
	if not both_are_not_player and has_node("/root/Battlefield") and randf() < 0.25:
			return
	$HitSound.play()