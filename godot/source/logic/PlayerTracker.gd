extends Node

signal player_changed(warrior)

var player setget set_player

func set_player(warrior):
	player = warrior
	emit_signal("player_changed", warrior)