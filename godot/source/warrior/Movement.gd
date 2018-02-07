extends "res://source/warrior/Code.gd"

var velocity = Vector2()

func up():
	towards(Const.UP)

func down():
	towards(Const.DOWN)

func left():
	towards(Const.LEFT)

func right():
	towards(Const.RIGHT)

func towards(direction):
	if direction.length_squared() > 1:
		direction = direction.normalized()
	var added_velocity = direction * warrior.speed
	velocity += added_velocity

func _physics_process(delta):
	velocity = velocity.clamped(warrior.speed)
	warrior.move_and_slide(velocity)
	velocity *= warrior.speed_drag