extends "res://source/ai/steering/behaviors/SteeringBehavior.gd"

func execute():
	if target == null:
		return Vector2()
	return seek_target() * multiplier

func seek_target():
	var target = Util.get_position(self.target)
	return seek(target)

func seek(target_position):
	var velocity = get_host().moving_vector(target_position - get_host().position)
	return velocity - get_host().velocity