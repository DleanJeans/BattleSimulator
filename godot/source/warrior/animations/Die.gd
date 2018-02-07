extends "res://source/warrior/animations/AnimationPlayer.gd"

var weapon

func track_weapon(weapon):
	self.weapon = weapon

func play_dead():
	var to_weapon_x = weapon.global_position.x - warrior.global_position.x
	var attacked_from_left = to_weapon_x < 0
	
	if attacked_from_left:
		play("DeathFromLeft")
	else:
		play("DeathFromRight")