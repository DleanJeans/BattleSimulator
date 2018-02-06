extends Node2D

export(NodePath) var player_path setget set_player_path

var warrior

func _physics_process(delta):
	_update_position()

func _update_position():
	if warrior != null:
		position = warrior.position

func set_player_path(path):
	player_path = path
	
	call_deferred("_update_warrior")

func _update_warrior():
	if player_path != null:
		warrior = get_node(player_path)