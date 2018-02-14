extends Node2D

export(Vector2) var spacing = Vector2(100, 100)
export(NodePath) var world_path
export(NodePath) var ai_core_path

onready var world = get_node(world_path)
var ai_core

var _team
var _troop_ai

func _ready():
	call("_create_level_%s" % Game.level)

func _create_level_1():
	create_squad(Const.TEAM_RED, 2, 2)
	position.x += 1000
	create_squad(Const.TEAM_PURPLE, 2, 2)

func _create_level_2():
	create_squad(Const.TEAM_RED)
	position.x += 1000
	create_squad(Const.TEAM_PURPLE)

func _create_level_3():
	create_squad(Const.TEAM_RED)
	position.y += 600
	create_squad(Const.TEAM_RED)
	
	position.x += 1000
	create_squad(Const.TEAM_PURPLE)
	position.y -= 600
	create_squad(Const.TEAM_PURPLE)

func create_squad(team, leader_side = Const.RIGHT, rows = 2, columns = 5):
	_team = team
	_setup_ai_if_path_provided()
	_troop_ai.set_team(team)
	
	for x in range(0, rows):
		for y in range(0, columns):
			create_warrior(x, y)
	
	create_warrior(rows * leader_side.x, 0.5 * columns / 2)

func _setup_ai_if_path_provided():
	if ai_core_path != null:
		ai_core = get_node(ai_core_path)
		_troop_ai = Scene.SquadAI.instance()
		ai_core.add_child(_troop_ai)

func create_warrior(row, column):
	var warrior_position = Vector2(row, column) * spacing
	var warrior = Scene.Warrior.instance()
	
	warrior.position = self.position + warrior_position
	warrior.team = _team
	world.add_child(warrior)
	
	if ai_core_path != null:
		var ai = Scene.WarriorAI.instance()
		_troop_ai.add_child(ai)
		ai.set_character(warrior)