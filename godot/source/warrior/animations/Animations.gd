extends Node

onready var warrior = get_parent()

var facing_left setget , get_facing_left
var attacking setget , is_attacking

func get_facing_left():
	return not warrior.sprite.flip_h

func is_attacking():
	return $Attack.is_playing()

func get_current_facing():
	return $Face.get_current_facing()

func stop_attacking():
	$Attack.seek($Attack.current_animation_length, true)
#	$Attack.stop()