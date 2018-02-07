extends "res://source/ai/warrior/AINode.gd"

onready var enemy_team = _enemy_team()

func find_enemy():
	var enemies = get_tree().get_nodes_in_group(enemy_team)
	if enemies.size() == 1:
		return enemies[0]

func _enemy_team():
	match host.team:
		Const.TEAM_PURPLE:
			return Const.TEAM_RED
		Const.TEAM_RED:
			return Const.TEAM_PURPLE