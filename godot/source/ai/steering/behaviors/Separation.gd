extends "res://source/ai/steering/behaviors/SteeringBehavior.gd"

export(float) var threshold_scale = 2 setget set_threshold_scale
export(float) var decay_coefficient = 1
export(float) var max_speed = 100

func execute():
	return separate() * multiplier

func separate():
	var steering = Vector2()
	
	for target in get_targets():
		var direction = target.global_position - get_character().global_position
		var distance = direction.length()
		
		var strength = decay_coefficient / (distance * distance)
		strength = min(strength, max_speed)
		
		direction = direction.normalized()
		steering += strength * direction
	
	return steering

func get_targets():
	return $ThresholdArea.get_overlapping_bodies()

func _physics_process(delta):
	_update_position()

func _update_position():
	$ThresholdArea.global_position = get_character().global_position

func set_threshold_scale(scale):
	threshold_scale = scale
	if has_node("ThresholdArea"):
		$ThresholdArea/Shape.scale = Vector2(1, 1) * scale