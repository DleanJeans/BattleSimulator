extends Node

export(int) var thoughts_per_second = 5
export(bool) var enabled = true
export(NodePath) var host_path
export(NodePath) var health_mechanic_path

onready var _thinking_interval = 1 / thoughts_per_second

func _ready():
	yield(get_tree().create_timer(0.1), "timeout")
	think()

func start_thinking():
	while enabled:
		yield(get_tree().create_timer(_thinking_interval), "timeout")
		think()

func think():
	var enemy = $Locator.find_enemy()
	$Move.to(enemy)
	yield($Move, "point_reached")
	$Attack.kill(enemy)

func get_host():
	return get_node(host_path)

func get_health_mechanic():
	if health_mechanic_path == null:
		return null
	return get_node(health_mechanic_path)