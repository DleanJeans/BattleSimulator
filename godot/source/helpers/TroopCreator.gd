extends Node2D

export(Vector2) var spacing = Vector2(100, 100)
export(NodePath) var world_path
export(NodePath) var ai_core_path

onready var world = get_node(world_path)
var ai_core

var _team
var _troop_ai

func _ready():
	create_troops(Const.TEAM_RED, 10, 10)
	position.x += 1250
	create_troops(Const.TEAM_PURPLE, 10, 10)

func _setup_ai_if_path_provided():
	if ai_core_path != null:
		ai_core = get_node(ai_core_path)
		_troop_ai = Scene.TroopAI.instance()
		ai_core.add_child(_troop_ai)

func create_troops(team, rows = 2, columns = 5):
	_team = team
	_setup_ai_if_path_provided()
	_troop_ai.set_team(team)
	
	for x in range(0, rows):
		for y in range(0, columns):
			create_warrior( x, y)

func create_warrior(row, column):
	var warrior_position = Vector2(row, column) * spacing
	var warrior = Scene.Warrior.instance()
	
	warrior.position = self.position + warrior_position
	world.add_child(warrior)
	warrior.team = _team
	
	if ai_core_path != null:
		var ai = Scene.WarriorAI.instance()
		_troop_ai.add_child(ai)
		ai.set_character(warrior)