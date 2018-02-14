extends Node

export(bool) var enabled = true
export(NodePath) var player_tracker_path
onready var PlayerTracker = get_node(player_tracker_path)

onready var _player_team = Game.player_team

func choose_randomly_from_player_team():
	var player = choose_random_from_group(_player_team)
	if player != null:
		set_player(player)

func choose_randomly_from_team(team):
	var player = choose_random_from_group(team)
	set_player(player)

func choose_random_from_group(group):
	var all_warriors = get_tree().get_nodes_in_group(group)
	
	var random_warrior
	while true:
		var warrior_count = all_warriors.size()
		
		if warrior_count == 0:
			return null
		
		var random_index = randi() % warrior_count
		random_warrior = all_warriors[random_index]
		
		if _filter_warrior(random_warrior):
			all_warriors.erase(random_warrior)
		else:
			break
	
	return random_warrior

func _filter_warrior(warrior):
	return warrior.is_dead() or warrior.is_leader()

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
	if not player.is_connected("died", self, "choose_randomly_from_player_team"):
		player.connect("died", self, "choose_randomly_from_player_team")

func _disable_warrior_ai(player):
	var warrior_ais = get_tree().get_nodes_in_group(player.team + "WarriorAI")
	for ai in warrior_ais:
		if ai.character_path == player.get_path():
			ai.queue_free()

func _ready():
	randomize()
	if _player_team == null:
		_player_team = Const.TEAM_PURPLE
	if enabled:
		yield(get_tree(), "idle_frame")
		choose_randomly_from_player_team()