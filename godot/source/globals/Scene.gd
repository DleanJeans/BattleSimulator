extends Node

var Warrior = load("res://source/warrior/Warrior.tscn")
var WarriorAI = load("res://source/ai/warrior/WarriorAI.tscn")
var TroopAI = load("res://source/ai/troop/TroopAI.tscn")

var Battlefield = preload("res://source/scenes/Battlefield.tscn")
var TeamChoosing = preload("res://source/scenes/TeamChoosing.tscn")

var BattlefieldPath = "res://source/scenes/Battlefield.tscn"
var TeamChoosingPath = "res://source/scenes/TeamChoosing.tscn"

var player_team