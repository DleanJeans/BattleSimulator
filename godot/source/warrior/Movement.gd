extends "res://source/warrior/Code.gd"

var velocity = Vector2()

func _ready():
	if has_node("/root/Battlefield"):
		set_physics_process(false)
		yield(get_tree().create_timer(1), "timeout")
		set_physics_process(true)

func up():
	towards(Const.UP)

func down():
	towards(Const.DOWN)

func left():
	towards(Const.LEFT)

func right():
	towards(Const.RIGHT)

func at(speed):
	if warrior.animation_center.is_attacking(): return
	
	velocity += speed

func towards(direction):
	if warrior.animation_center.is_attacking(): return
	
	if direction.length_squared() > 1:
		direction = direction.normalized()
	var added_velocity = direction * warrior.speed
	velocity += added_velocity

func _physics_process(delta):
	velocity = velocity.clamped(warrior.speed)
	warrior.move_and_slide(velocity)
	velocity *= warrior.speed_drag