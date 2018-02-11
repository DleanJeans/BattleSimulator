extends "res://source/warrior/animations/AnimationPlayer.gd"

var _current_facing = "Down"

func _process(delta):
	var velocity = warrior.velocity
	if velocity == Vector2():
		return
	
	var direction_angle = velocity.angle_to_point(Vector2())
	direction_angle = rad2deg(direction_angle)
	direction_angle = _round_to_nearest(90, direction_angle)
	
	match int(direction_angle):
		-180, 180: left()
		-90: up()
		0: right()
		90: down()

func _round_to_nearest(nearest, value):
	return round(value / nearest) * nearest

func up():
	play("Up")

func down():
	play("Down")

func left():
	play("Left")

func right():
	play("Right")

func play(name):
	if name == _current_facing:
		return
	_current_facing = name
	.play(name)

func get_current_facing():
	return _current_facing