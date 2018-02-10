extends Node2D

func find_enemy():
	return find_nearest_global_enemy()

func find_nearest_global_enemy():
	return find_nearest_enemy_in(_get_enemies())

func find_nearest_enemy_in(enemies):
	var nearest_enemy
	var nearest_distance = INF
	
	for enemy in enemies:
		if _filter_enemy(enemy): continue
		
		var distance_to_enemy = distance_to(enemy)
		if distance_to_enemy < nearest_distance:
			nearest_enemy = enemy
			nearest_distance = distance_to_enemy
	
	return nearest_enemy

func _filter_enemy(enemy):
	return false # override this

func distance_to(node):
	return get_parent().global_position.distance_to(node.global_position)

func _get_enemies():
	var enemy_team = _get_enemy_team()
	return get_tree().get_nodes_in_group(enemy_team)

func _get_enemy_team():
	match _get_friendly_team():
		Const.TEAM_PURPLE:
			return Const.TEAM_RED
		Const.TEAM_RED:
			return Const.TEAM_PURPLE

func _get_friendly_team():
	pass # override this