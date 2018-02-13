extends Node

signal player_changed(warrior)

var player setget set_player

func set_player(warrior):
	player = warrior
	emit_signal("player_changed", warrior)
	Game.player = warrior
	
	match Game.level:
		2:
			player.change_sword()
			player.set_attack_damage(3)
		3:
			player.change_sword()
			player.set_attack_damage(5)