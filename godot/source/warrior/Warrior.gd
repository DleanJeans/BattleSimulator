tool
extends KinematicBody2D

signal hit(me, damage)
signal hit_by_weapon(weapon)
signal died

export(String, "TeamRed", "TeamPurple") var team setget set_team

export(int) var speed = 250
export(int) var speed_drag = 0.9
export(float) var attack_duration = 0.5

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