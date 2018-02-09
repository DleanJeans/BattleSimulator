extends "res://source/warrior/animations/AnimationPlayer.gd"

var _current_facing

func _process(delta):
	var velocity = warrior.velocity
	var direction_angle = velocity.angle_to_point(Vector2())
	direction_angle = rad2deg(direction_angle)
	direction_angle = _round_to_nearest(90, direction_angle)
	
	match int(direction_angle):
		-180, 180: _flip_left()
		-90: _flip_up()
		0: _flip_right()
		90: _flip_down()

func _round_to_nearest(nearest, value):
	return round(value / nearest) * nearest

func _flip_up():
	play("Up")

func _flip_down():
	play("Down")

func _flip_left():
	play("Left")

func _flip_right():
	play("Right")

func play(name):
	if name == _current_facing:
		return
	animation_center.stop_attacking()
	_current_facing = name
	.play(name)

func get_current_facing():
	return _current_facing