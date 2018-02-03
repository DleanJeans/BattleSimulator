extends KinematicBody2D

export(int) var speed = 250
export(int) var speed_drag = 0.9

onready var sprite = $Sprite
onready var sword = $Sprite/Sword
onready var move = $Code/Movement

var velocity setget , get_velocity

func get_velocity():
	return move.velocity

func attack():
	$Animations/Attack.play_attack()