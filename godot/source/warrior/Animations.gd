extends Node

onready var warrior = get_parent()

var facing_left setget , get_facing_left
var attacking setget , is_attacking

func get_facing_left():
	return not warrior.sprite.flip_h

func is_attacking():
	return $Attack.is_playing()