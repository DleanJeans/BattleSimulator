extends Node2D

export(int) var thoughts_per_second = 5
export(bool) var enabled = true

onready var _thinking_interval = 1 / thoughts_per_second
var _team

func set_team(team):
	_team = team
	add_to_group(team + "TroopAI")

func _ready():
	yield(get_tree().create_timer(0.1), "timeout")
#	think()

func start_thinking():
	while enabled:
		yield(get_tree().create_timer(_thinking_interval), "timeout")
		think()

func think():
	var enemy = $Locator.find_enemy()
	$Move.to(enemy)
	yield($Move, "point_reached")

func get_ai_core():
	return get_parent()

func call_all_sub_ais(method, args):
	return $SubAI.propagate_call(method, args)

func add_child(ai_node):
	$SubAI.add_child(ai_node)

func _physics_process(delta):
	_update_position()

func _update_position():
	var warriors = $SubAI.get_children()
	var total_position = Vector2()
	
	for warrior in warriors:
		total_position += warrior.global_position
	
	var average_position = total_position / warriors.size()
	
	global_position = average_position