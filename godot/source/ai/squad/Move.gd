extends "res://source/ai/BaseMove.gd"

func _process(delta):
	var locator = get_parent().get_locator()
	var enemy = locator.find_enemy()
	
	if enemy == null: return
	
	var direction = enemy.global_position - get_parent().global_position
	var distance_to_enemy = direction.length()
	
	if distance_to_enemy > 250:
		to(enemy)
	else: stop()

func _ready():
	set_physics_process(true)
	$Steering.set_character(get_parent())

func _update_movement():
	get_parent().call_all_sub_ais("_move_towards", [_steer_velocity])