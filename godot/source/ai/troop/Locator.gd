extends "res://source/ai/BaseLocator.gd"

func find_enemy():
	var enemyTroops = _get_enemies()
	if enemyTroops.size() == 1:
		return enemyTroops[0]

func _get_enemies():
	var enemy_team = _get_enemy_team()
	var group = enemy_team + "TroopAI"
	return get_tree().get_nodes_in_group(group)

func _get_friendly_team():
	return get_parent()._team