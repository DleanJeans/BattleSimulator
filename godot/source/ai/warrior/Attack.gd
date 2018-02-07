extends "res://source/ai/warrior/AINode.gd"

var target

func kill(target):
	self.target = target
	while _target_not_dead():
		attack()
		yield(_timer_for_attack_duration(), "timeout")

func _timer_for_attack_duration():
	var host = get_parent().get_host()
	var attack_duration = host.attack_duration
	
	return get_tree().create_timer(attack_duration)

func _target_not_dead():
	var health_mechanic = get_parent().get_health_mechanic()
	if health_mechanic != null:
		return not health_mechanic.is_dead(target) 
	return true

func attack():
	var host = get_parent().get_host()
	host.attack()