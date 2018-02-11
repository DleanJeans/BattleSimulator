extends Node

signal hit_zero(warrior)

var warrior
var value

func _init(warrior, value):
	self.warrior = warrior
	self.value = value

func lose(damage):
	self.value -= damage
	
	if is_value_zero():
		die()

func is_value_zero():
	return value <= 0

func die():
	emit_signal("hit_zero", warrior)