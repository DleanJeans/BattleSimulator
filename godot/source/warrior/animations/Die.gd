extends "res://source/warrior/animations/AnimationPlayer.gd"

func play_dead():
	if animation_center.facing_left:
		play("DieLeft")
	else:
		play("DieRight")