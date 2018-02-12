extends "res://source/warrior/animations/AnimationPlayer.gd"

func _ready():
	_randomize_attack_duration()

func _randomize_attack_duration():
	playback_speed += rand_range(-0.025, 0.025)

func play_attack():
	if not is_playing():
		attack_facing_side()
		if not warrior.is_player() and has_node("/root/Battlefield") and randf() < 0.25:
			return
		$SwordSwing.play()

func attack_facing_side():
	var facing = animation_center.get_current_facing()
	play(facing)