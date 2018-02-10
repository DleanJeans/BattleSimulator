extends Node

export(NodePath) var player_tracker_path
onready var PlayerTracker = get_node(player_tracker_path)

var _player_team

func choose_randomly_from_player_team():
	var player = choose_random_from_group(_player_team)
	if player != null:
		set_player(player)

func choose_randomly_from_team(team):
	var player = choose_random_from_group(team)
	set_player(player)

func choose_random_from_group(group):
	var all_warriors = get_tree().get_nodes_in_group(group)
	var warrior_count = all_warriors.size()
	
	if warrior_count == 0:
		return null
	
	var random_index = randi() % warrior_count
	var random_warrior = all_warriors[random_index]
	
	return random_warrior

func choose_randomly():
	var player = choose_random_from_group("Warriors")
	set_player(player)
	_player_team = player.team

func set_player(player):
	_update_player_tracker(player)
	_choose_another_if_player_died(player)
	_disable_warrior_ai(player)

func _update_player_tracker(player):
	PlayerTracker.player = player

func _choose_another_if_player_died(player):
	player.connect("died", self, "choose_randomly_from_player_team")

func _disable_warrior_ai(player):
	var warrior_ais = get_tree().get_nodes_in_group(player.team + "WarriorAI")
	for ai in warrior_ais:
		if ai.character_path == player.get_path():
			ai.queue_free()

func _ready():
	randomize()
	choose_randomly()