extends Node2D

export(float) var zoom = 1 setget set_zoom

var player

func _physics_process(delta):
	_update_position()

func _update_position():
	if player != null:
		position = player.position


func set_zoom(new_zoom):
	zoom = new_zoom
	if has_node("Camera"):
		$Camera.zoom = Vector2(1, 1) * zoom

func set_player(new_player):
	player = new_player