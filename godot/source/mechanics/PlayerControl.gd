extends Node

export(NodePath) var player_path
export(NodePath) var health_mechanic_path

const UP = "up"
const DOWN = "down"
const LEFT = "left"
const RIGHT = "right"
const ATTACK = "attack"

func _physics_process(delta):
	var player = get_player()
	
	if player == null or _player_is_dead(): return
	
	if Input.is_action_pressed(UP):
		player.move.up()
	if Input.is_action_pressed(DOWN):
		player.move.down()
	if Input.is_action_pressed(LEFT):
		player.move.left()
	if Input.is_action_pressed(RIGHT):
		player.move.right()
	
	if Input.is_action_just_pressed(ATTACK):
		player.attack()

func _player_is_dead():
	return get_player().is_dead()

func set_player(new_player):
	player_path = new_player.get_path()

func get_player():
	if player_path == null:
		return null
	return get_node(player_path)