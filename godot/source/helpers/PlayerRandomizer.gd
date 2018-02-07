extends Node

export(NodePath) var player_tracker_path
onready var PlayerTracker = get_node(player_tracker_path)

func choose_randomly():
	var all_warriors = get_tree().get_nodes_in_group("Warriors")
	var warrior_count = all_warriors.size()
	var random_index = randi() % warrior_count
	var random_warrior = all_warriors[random_index]
	
	set_warrior_as_player(random_warrior)

func set_warrior_as_player(warrior):
	PlayerTracker.player = warrior

func _ready():
	randomize()
	choose_randomly()