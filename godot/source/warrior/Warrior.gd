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
var _is_leader = false

func _ready():
	match team:
		Const.TEAM_RED: face.right()
		Const.TEAM_PURPLE: face.left()

func set_leader():
	_is_leader = true
	set_attack_damage(get_attack_damage() * 2)
	scale *= 1.5

func get_attack_damage():
	return $Sprite/Sword.damage

func is_leader():
	return _is_leader

func is_player():
	return self == Game.player

func change_sword():
	match Game.level:
		2:
			$Sprite/Sword/Sprite.flip_v = true
		3:
			$Sprite/Sword/Sprite.texture = load("res://assets/png/Warrior.png")
			$Sprite/Sword/Sprite.hframes = 3
			$Sprite/Sword/Sprite.frame = 1
			if team == Const.TEAM_RED:
				$Sprite/Sword/Sprite.use_parent_material = true

func set_attack_damage(attack_damage):
	$Sprite/Sword.damage = attack_damage

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
	$DieSound.play()
	self_destroy()
	
	if is_in_group(team):
		remove_from_group(team)
	
	emit_signal("died")

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
	$Code/Team.set_team(team_name)