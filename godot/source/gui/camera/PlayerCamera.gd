extends Node2D

export(float) var zoom = 1 setget set_zoom
export(int) var lerp_speed = 0.1

var player

func _physics_process(delta):
	_update_position()

func _update_position():
	if player != null and is_inside_tree():
		global_position = player.global_position

func set_zoom(new_zoom):
	zoom = new_zoom
	if has_node("Camera"):
		$Camera.zoom = Vector2(1, 1) * zoom

func set_player(new_player):
	player = new_player