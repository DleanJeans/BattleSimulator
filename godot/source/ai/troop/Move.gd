extends "res://source/ai/BaseMove.gd"

func _process(delta):
	var locator = get_parent().get_locator()
	var enemy = locator.find_enemy()
	
	if enemy == null: return
	
	to(enemy)

func _ready():
	set_physics_process(true)
	$Steering.set_character(get_parent())

func _update_movement():
	get_parent().call_all_sub_ais("_move_towards", [_steer_velocity])