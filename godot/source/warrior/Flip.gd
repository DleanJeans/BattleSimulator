extends "res://source/warrior/AnimationPlayer.gd"

func _process(delta):
	var velocity_x = warrior.velocity.x
	
	if velocity_x < 0:
		_flip_left()
	elif velocity_x > 0:
		_flip_right()

func _flip_left():
	play("Left")

func _flip_right():
	play("Right")