extends "res://source/warrior/animations/AnimationPlayer.gd"

const BOBBING = "Bobbing"
const STOP = "Stop"

func _process(delta):
	if _moving_fast_enough():
		start_bobbing()
	elif is_playing():
		stop_bobbing()

func _moving_fast_enough():
	var moving_speed = warrior.velocity.length_squared()
	var fast_speed = warrior.speed * warrior.speed * 0.8
	
	return moving_speed > fast_speed

func start_bobbing():
	if _not_playing(BOBBING):
		play(BOBBING)

func stop_bobbing():
	play(STOP)