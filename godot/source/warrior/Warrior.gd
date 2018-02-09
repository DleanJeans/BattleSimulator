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
onready var attack_animation = $Animations/Attack

var velocity setget , get_velocity
var _dead = false

func is_dead():
	return _dead

func get_velocity():
	return Vector2() if move == null else move.velocity

func attack():
	$Animations/Attack.play_attack()

func die():
	print("%s just died!" % name)
	_dead = true
	emit_signal("died")
	self_destroy()

func self_destroy():
	yield($Animations/Die, "animation_finished")
	$Feet.queue_free()
	$HitArea.queue_free()
	$Code.queue_free()
	$Animations.queue_free()
	$Sprite/Sword.shape_enabled = false

func set_team(team_name):
	team = team_name
	if has_node("Code/Team"):
		$Code/Team.set_team(team_name)