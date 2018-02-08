extends "res://source/ai/BaseMove.gd"

func _ready():
	$Steering.set_character(get_parent())

func _update_movement():
	get_parent().call_all_sub_ais("_move_towards", [_steer_velocity])