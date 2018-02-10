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
		attack()
	else: stop()

func _find_new_enemy():
	var locator = get_parent().get_locator()
	var new_enemy = locator.find_enemy()
	
	get_parent()._set_enemy(new_enemy)

func attack():
	var character = get_parent().get_character()
	character.attack()

func stop():
	_enabled = false