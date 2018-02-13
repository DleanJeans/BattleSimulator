extends Control

export(NodePath) var health_mechanic_path

onready var health_mechanic = get_node(health_mechanic_path)

func _ready():
	for warrior in get_tree().get_nodes_in_group("Warriors"):
		_create_health_bar(warrior)

func _create_health_bar(warrior):
	var health_bar = Scene.HealthBar.instance()
	health_bar.max_value = health_mechanic.warrior_health
	health_bar.set_warrior(warrior)
	add_child(health_bar)