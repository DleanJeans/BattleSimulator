extends Node2D

onready var team_red = $World/TeamRed
onready var team_purple = $World/TeamPurple

func _ready():
	team_red.face.left()
	team_purple.face.right()
	
	team_red.connect("died", self, "start_game", [team_purple.name])
	team_purple.connect("died", self, "start_game", [team_red.name])

func start_game(team):
	print("Starting game with %s" % team)
	Scene.player_team = team
	get_tree().change_scene(Scene.BattlefieldPath)