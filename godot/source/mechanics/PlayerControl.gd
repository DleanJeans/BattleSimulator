extends Node

var player setget set_player

const UP = "up"
const DOWN = "down"
const LEFT = "left"
const RIGHT = "right"
const ATTACK = "attack"

func _physics_process(delta):
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

func set_player(new_player):
	player = new_player