extends Node2D

export(NodePath) var character_path #setget set_character_path

export(int) var thoughts_per_second = 5
export(float) var far_distance_threshold = 100

var enable_individual_thinking = false setget set_enable_individual_thinking
var velocity setget , get_velocity
onready var _thinking_interval = 1.0 / thoughts_per_second

var _enemy

func get_enemy():
	return _enemy

func get_velocity():
	return get_character().get_velocity()

func _ready():
	$Move.set_process(false)
	$Attack.set_process(false)
	$Locator.connect("enemy_detected_nearby", self, "_set_enemy")

func _set_enemy(enemy):
	if _enemy != null and not _enemy.is_dead(): return
	self.enable_individual_thinking = true
	
	_enemy = enemy
	if enemy is Class.WarriorAI:
		enemy = enemy.get_character()
	
	if not enemy.is_connected("died", self, "_on_enemy_died"):
		enemy.connect("died", self, "_on_enemy_died")

func _on_enemy_died():
	_enemy = null

func _move_towards(direction):
	if not enable_individual_thinking:
		get_character().move.at(direction)

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

func set_enable_individual_thinking(enabled):
	enable_individual_thinking = enabled
	$Move.set_process(enabled)
	$Attack.set_process(enabled)