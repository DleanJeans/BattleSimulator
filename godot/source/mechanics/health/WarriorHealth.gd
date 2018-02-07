extends Node

signal hit_zero(warrior)

var warrior
var health

func _init(warrior, health):
	self.warrior = warrior
	self.health = health

func lose(damage):
	self.health -= damage
	
	if is_health_zero():
		die()

func is_health_zero():
	return health <= 0

func die():
	emit_signal("hit_zero", warrior)