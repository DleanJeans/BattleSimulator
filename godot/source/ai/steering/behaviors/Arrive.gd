extends "res://source/ai/steering/behaviors/SteeringBehavior.gd"

export(float) var deceleration = 0.5

func execute():
	if target == null:
		return Vector2()
	return arrive() * multiplier

func arrive():
	var target = Util.get_position(self.target)
	var to_target = target - get_host().global_position
	var distance = to_target.length()
	
	if distance > 0:
		var speed = distance / deceleration
		speed = min(speed, get_host().speed)
		
		var velocity = to_target * speed / distance
		
		return velocity - get_host().velocity
	
	return Vector2()