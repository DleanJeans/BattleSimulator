extends Node2D

export(NodePath) var character_path

export(float) var thoughts_per_second = 1
export(bool) var enabled = true
export(bool) var allow_free_thinking = true
export(float) var far_distance_threshold = 100

onready var _thinking_interval = 1.0 / thoughts_per_second
var velocity setget , get_velocity

func get_velocity():
	return get_character().get_velocity()

func _ready():
	start_thinking()

func start_thinking():
	while enabled:
		yield(get_tree().create_timer(_thinking_interval), "timeout")
		think()

func think():
	if not allow_free_thinking: return
	
	var enemy = $Locator.find_enemy()
	if enemy == null:
		$Move.stop()
		return
	
	if _enemy_is_faraway(enemy):
		$Move.to(enemy)
	yield($Move, "point_reached")
	$Attack.start_attacking(enemy)

func _enemy_is_faraway(enemy):
	var distance_to_enemy = $Locator.distance_to(enemy)
	return distance_to_enemy > far_distance_threshold

func _move_towards(direction):
	get_character().move.towards(direction)

func _physics_process(delta):
	_update_position()

func _update_position():
	global_position = get_character().global_position

func get_character():
	return $GetterSetter.get_character()

func set_character(character):
	$GetterSetter.set_character(character)

func get_locator():
	return $Locator