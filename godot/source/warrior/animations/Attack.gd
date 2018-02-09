extends "res://source/warrior/animations/AnimationPlayer.gd"

func play_attack():
	if not is_playing():
		attack_facing_side()

func attack_facing_side():
	var facing = animation_center.get_current_facing()
	play(facing)