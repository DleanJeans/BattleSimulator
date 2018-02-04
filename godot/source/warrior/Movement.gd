extends "res://source/warrior/Code.gd"

var velocity = Vector2()

func up():
	move(Const.UP)

func down():
	move(Const.DOWN)

func left():
	move(Const.LEFT)

func right():
	move(Const.RIGHT)

func move(direction):
	if warrior.animations.attacking: return
	
	var added_velocity = direction * warrior.speed
	velocity += added_velocity

func _physics_process(delta):
	velocity = velocity.clamped(warrior.speed)
	warrior.move_and_slide(velocity)
	velocity *= warrior.speed_drag