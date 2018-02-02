extends "res://source/warrior/AnimationPlayer.gd"

const ATTACK_LEFT = "AttackLeft"
const ATTACK_RIGHT = "AttackRight"

func play_attack():
	if _playing(ATTACK_LEFT) or _playing(ATTACK_RIGHT): return
	
	if warrior.facing_left:
		play(ATTACK_LEFT)
	else:
		play(ATTACK_RIGHT)