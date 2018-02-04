extends Node

export(int) var WARRIOR_HEALTH = 5
export(NodePath) var scan_node_childen

var health_dictionary = {}

onready var _node_to_scan = get_node(scan_node_childen)

var _processed_warrior
var _processed_health

func _ready():
	scan_warriors()

func scan_warriors():
	for node in _node_to_scan.get_children():
		if node is Class.Warrior:
			add_warrior(node)

func add_warrior(warrior, health = WARRIOR_HEALTH):
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
	_processed_health.lose(damage)
	print("%s received %s damage - %s HP left" % [warrior.name, damage, _processed_health.health])

func _on_health_hit_zero(warrior):
	warrior.die()