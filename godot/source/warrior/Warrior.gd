extends KinematicBody2D

signal hit(me, damage)
signal hit_by_weapon(weapon)
signal died
signal health_changed(health)

export(String, "Null", "TeamRed", "TeamPurple") var team = "Null" setget set_team

export(int) var speed = 250
export(int) var speed_drag = 0.9
export(float) var attack_duration = 0.5

onready var sprite = $Sprite
onready var sword = $Sprite/Sword
onready var move = $Code/Movement
onready var face = $AnimationCenter/Face
onready var hit_area = $HitArea
onready var animation_center = $AnimationCenter
onready var attack_animation = $AnimationCenter/Attack

var velocity setget , get_velocity
var _dead = false

func is_dead():
	return _dead

func get_velocity():
	return Vector2() if move == null else move.velocity

func attack():
	$AnimationCenter/Attack.play_attack()

func die():
	# delegate to an idle frame
	# so the game won't crash
	yield(get_tree(), "idle_frame")
	
	print("%s just died!" % name)
	_dead = true
	emit_signal("died")
	self_destroy()

func self_destroy():
	yield($AnimationCenter/Die, "animation_finished")
	$Feet.queue_free()
	$HitArea.queue_free()
	$Code.queue_free()
	$AnimationCenter.queue_free()
	$Sprite/Sword.shape_enabled = false

func emit_health_changed(health):
	emit_signal("health_changed", health)

func set_team(team_name):
	if team_name == "Null":
		return
	
	team = team_name
	yield(self, "tree_entered")
#	if is_inside_tree() and has_node("Code/Team"):
#	if has_node("Code/Team"):
	$Code/Team.set_team(team_name)