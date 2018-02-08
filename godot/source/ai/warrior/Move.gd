extends "res://source/ai/BaseMove.gd"

func _ready():
	yield(get_parent(), "tree_entered")
	var character = get_parent().get_character()
	$Steering.character_path = character.get_path()

func _update_movement():
	get_parent().get_character().move.towards(_steer_velocity)