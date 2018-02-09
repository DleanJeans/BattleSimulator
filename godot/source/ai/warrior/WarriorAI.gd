extends Node2D

export(NodePath) var character_path #setget set_character_path

export(int) var thoughts_per_second = 2
export(float) var far_distance_threshold = 100

onready var _thinking_interval = 1.0 / thoughts_per_second
var velocity setget , get_velocity

var _enemy

func get_enemy():
	return _enemy

func get_velocity():
	return get_character().get_velocity()

func _ready():
	$Locator.connect("enemy_detected_nearby", self, "_set_enemy")

func _set_enemy(enemy):
	_enemy = enemy

func _move_towards(direction):
	if _enemy == null:
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

func set_character_path(path):
	if path != null:
		$GetterSetter.set_character(get_node(path))