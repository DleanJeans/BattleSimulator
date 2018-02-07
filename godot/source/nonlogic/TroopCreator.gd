extends Node2D

export(Vector2) var spacing = Vector2(100, 100)
export(NodePath) var world_path
onready var world = get_node(world_path)

func _ready():
	create_troops(Const.TEAM_RED, 10, 10)
	position.x += 1250
	create_troops(Const.TEAM_PURPLE, 10, 10)

func create_troops(team, rows = 2, columns = 5):
	for x in range(0, rows):
		for y in range(0, columns):
			create_warrior(team, x, y)

func create_warrior(team, row, column):
	var warrior_position = Vector2(row, column) * spacing
	var warrior = Scene.Warrior.instance()
	
	warrior.position = self.position + warrior_position
	warrior.team = team
	world.add_child(warrior)