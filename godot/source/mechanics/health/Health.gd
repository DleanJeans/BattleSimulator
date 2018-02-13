extends Node

signal warrior_health_changed(warrior, health)

export(int) var warrior_health = 20
export(NodePath) var scan_node_childen

var health_dictionary = {}

onready var _node_to_scan = get_node(scan_node_childen)

var _processed_warrior
var _processed_health

func get_health(warrior):
	_set_processed_warrior(warrior)
	return _processed_health.value

func is_dead(warrior):
	_set_processed_warrior(warrior)
	return _processed_health.is_health_zero()

func _ready():
	scan_warriors()
	if not has_node("/root/Battlefield"):
		return
	match Game.level:
		1: warrior_health = 15
		2: warrior_health = 20
		3: warrior_health = 30

func scan_warriors():
	for node in _node_to_scan.get_children():
		if node is Class.Warrior:
			add_warrior(node)

func add_warrior(warrior, health = warrior_health):
	_create_health_data(warrior, health)
	_set_processed_warrior(warrior)
	_connect_signals()

func _create_health_data(warrior, health):
	var health_data = Class.WarriorHealth.new(warrior, health)
	health_dictionary[warrior] = health_data

func _set_processed_warrior(warrior):
	_processed_warrior = warrior
	_processed_health = health_dictionary[warrior]

func _connect_signals():
	_processed_warrior.connect("hit", self, "_on_warrior_hit")
	_processed_health.connect("hit_zero", self, "_on_health_hit_zero")

func _on_warrior_hit(warrior, damage):
	_set_processed_warrior(warrior)
	_print_debug(warrior, damage)
	_processed_health.lose(damage)
	warrior.emit_health_changed(_processed_health.value)

func _print_debug(warrior, damage):
	var hp_left = _processed_health.value - damage
	
func _on_health_hit_zero(warrior):
	warrior.die()