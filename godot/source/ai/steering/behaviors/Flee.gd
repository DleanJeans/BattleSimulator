extends "res://source/ai/steering/behaviors/SteeringBehavior.gd"

func execute():
	return flee_target() * multiplier

func flee_target():
	if target == null:
		return Vector2()
	return flee(target)

func flee(target_position):
	var distance_squared = target_position.distance_to(get_character().position) + 1
	var velocity = get_character().moving_vector(get_character().position - target_position, self.panic_radius / distance_squared * multiplier)
	
	return velocity - get_character().velocity