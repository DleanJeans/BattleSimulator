extends "res://source/warrior/AnimationPlayer.gd"

const ATTACK_LEFT = "AttackLeft"
const ATTACK_RIGHT = "AttackRight"

func play_attack():
	if is_playing():
		return
	
	if animation_center.facing_left:
		play(ATTACK_LEFT)
	else:
		play(ATTACK_RIGHT)