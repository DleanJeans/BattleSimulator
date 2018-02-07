extends Node

signal hit_zero(warrior)

var warrior
var health

func _init(warrior, health):
	self.warrior = warrior
	self.health = health

func lose(damage):
	self.health -= damage
	
	if self.health <= 0:
		die()

func die():
	emit_signal("hit_zero", warrior)