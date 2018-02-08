extends "res://source/ai/BaseLocator.gd"

func find_enemy():
	var enemy = find_nearest_enemy_nearby()
	if enemy == null:
		enemy = find_nearest_global_enemy()
	return enemy

func find_nearest_enemy_nearby():
	var nearby_enemies = _get_nearby_enemies()
	return find_nearest_enemy_in(nearby_enemies)

func _get_nearby_enemies():
	var nearby_bodies = $NearbyArea.get_overlapping_bodies()
	var nearby_enemies = []
	
	for body in nearby_bodies:
		if body.is_in_group(_get_enemy_team()):
			nearby_enemies.append(body)
	
	return nearby_enemies

func _get_friendly_team():
	return get_parent().get_character().team