extends Node

export(int) var total_force = 250
export(NodePath) var character_path = ".."

var priorities = ["Separation", "Arrive", "Flee", "Seek"]

var _steering_velocity
var _force_left

func get_character():
	return get_node(character_path)

func set_character(character):
	character_path = character.get_path()

func steer():
	_steering_velocity = Vector2()
	_force_left = total_force
	
	for behavior in priorities:
		_add_behavior_velocity_if_is_on(behavior)
		if _force_left <= 0:
			break
	
	return _steering_velocity

func _add_behavior_velocity_if_is_on(behavior_name):
	var behavior = get_node(behavior_name)
	if behavior.is_on:
		_add_behavior_velocity(behavior)

func _add_behavior_velocity(behavior):
	var velocity = behavior.execute()
	var magnitude = velocity.length()
	
	_steering_velocity += velocity.clamped(_force_left)
	_force_left -= magnitude

func all_off():
	for child in get_children():
		child.off()

func seek_on(target):
	$Seek.on(target)

func seek_off():
	$Seek.off()

func arrive_on(target):
	$Arrive.on(target)

func arrive_off():
	$Arrive.off()

func flee_on(target):
	$Flee.on(target)

func flee_off():
	$Flee.off()