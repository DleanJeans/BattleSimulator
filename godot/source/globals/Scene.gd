extends Node

var Warrior = load("res://source/warrior/Warrior.tscn")
var WarriorAI = load("res://source/ai/warrior/WarriorAI.tscn")
var TroopAI = load("res://source/ai/troop/TroopAI.tscn")

var HealthBarPath = "res://source/gui/health_bars/HealthBar.tscn"
var BattlefieldPath = "res://source/scenes/Battlefield.tscn"
var TeamChoosingPath = "res://source/scenes/TeamChoosing.tscn"

var player
var player_team = "TeamPurple"
var level = 1

func _process(delta):
	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen