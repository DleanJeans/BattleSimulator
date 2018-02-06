extends KinematicBody2D

signal hit(me, damage)
signal died

export(String, "Team 1", "Team 2") var team setget set_team

export(int) var speed = 250
export(int) var speed_drag = 0.9

onready var sprite = $Sprite
onready var sword = $Sprite/Sword
onready var move = $Code/Movement
onready var hit_area = $HitArea
onready var animations = $Animations

var velocity setget , get_velocity

func get_velocity():
	return move.velocity if move != null else Vector2()

func attack():
	$Animations/Attack.play_attack()

func die():
	print("%s just died!" % name)
	emit_signal("died")

func set_team(team_name):
	team = team_name
	if has_node("Code/Team"):
		$Code/Team.set_team(team_name)