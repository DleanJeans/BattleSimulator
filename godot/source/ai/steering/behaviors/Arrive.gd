extends "res://source/ai/steering/behaviors/SteeringBehavior.gd"

export(float) var max_speed = 250
export(float) var deceleration = 0.5

func execute():
	if target == null:
		return Vector2()
	return arrive() * multiplier

func arrive():
	var target = Util.get_position(self.target)
	var direction = target - get_character().global_position
	var distance = direction.length()
	
	if distance > 0:
		var speed = distance / deceleration
		speed = min(speed, max_speed)
		
		var velocity = direction * speed / distance
		
		return velocity - get_character().velocity
	
	return Vector2()