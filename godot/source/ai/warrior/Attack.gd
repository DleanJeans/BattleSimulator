extends Node

signal target_killed

var target

var _enabled = true

func _process(delta):
	var enemy = get_parent().get_enemy()
	if enemy == null: return
	
	var locator = get_parent().get_locator()
	var enemy_is_close = locator.is_enemy_close(enemy)
	
	if enemy_is_close:
		start_attacking(enemy)
	else: stop()

func start_attacking(target):
	if _enabled: return
	
	self.target = target
	_enabled = true
	
	while _enabled and _target_not_dead():
		call_deferred("attack")
		yield(get_parent().get_character().attack_animation, "animation_finished")

func _target_not_dead():
	return not target_is_killed()

func _find_new_enemy():
	var locator = get_parent().get_locator()
	var new_enemy = locator.find_enemy()
	
	get_parent()._set_enemy(new_enemy)

func target_is_killed():
	return target == null or target.is_dead()

func attack():
	var character = get_parent().get_character()
	character.attack()

func stop():
	_enabled = false