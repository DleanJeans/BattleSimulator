extends Node

var target

func start_attacking(target):
	self.target = target
	while _target_not_dead():
		attack()
		yield(_timer_for_attack_duration(), "timeout")

func _timer_for_attack_duration():
	var character = get_parent().get_character()
	var attack_duration = character.attack_duration
	
	return get_tree().create_timer(attack_duration)

func _target_not_dead():
	return target != null and not target.is_dead()

func attack():
	var character = get_parent().get_character()
	character.attack()