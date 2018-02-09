extends "res://source/ai/BaseMove.gd"

func _process(delta):
	var enemy = get_parent().get_enemy()
	if enemy == null: return
	
	var locator = get_parent().get_locator()
	var enemy_is_too_close = locator.is_enemy_too_close(enemy)
	
	if  enemy_is_too_close:
		stop()
	else:
		to(enemy)

func _ready():
	yield(get_parent(), "tree_entered")
	var character = get_parent().get_character()
	$Steering.character_path = character.get_path()

func _update_movement():
	get_parent().get_character().move.towards(_steer_velocity)