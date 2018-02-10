extends "res://source/ai/BaseLocator.gd"

export(float) var too_close_threshold = 125
export(float) var close_threshold = 175

signal enemy_detected_nearby(enemy)

func is_enemy_too_close(enemy):
	var distance_to_enemy = distance_to(enemy)
	return distance_to_enemy <= too_close_threshold

func is_enemy_close(enemy):
	var distance_to_enemy = distance_to(enemy)
	return distance_to_enemy <= close_threshold

func are_enemies_nearby():
	var nearby_enemies = _get_nearby_enemies()
	return nearby_enemies.size() > 0

func find_enemy():
	var enemy = find_nearest_enemy_nearby()
	if enemy == null:
		enemy = find_nearest_global_enemy()
	return enemy

func _filter_enemy(enemy):
	return enemy.is_dead()

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

func _on_NearbyArea_body_entered(body):
	if body.is_in_group(_get_enemy_team()):
		emit_signal("enemy_detected_nearby", body)