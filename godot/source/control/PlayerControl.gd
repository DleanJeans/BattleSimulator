extends Node

export(NodePath) var warrior_path
onready var warrior = get_node(warrior_path)

const UP = "up"
const DOWN = "down"
const LEFT = "left"
const RIGHT = "right"
const ATTACK = "attack"

func _physics_process(delta):
	if Input.is_action_pressed(UP):
		warrior.move.up()
	if Input.is_action_pressed(DOWN):
		warrior.move.down()
	if Input.is_action_pressed(LEFT):
		warrior.move.left()
	if Input.is_action_pressed(RIGHT):
		warrior.move.right()
	
	if Input.is_action_just_pressed(ATTACK):
		warrior.attack()