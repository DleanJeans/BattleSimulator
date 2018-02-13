extends Node

var last_music_position = 0

var player
var player_team = "TeamPurple"
var level = 1

func _ready():
	pause_mode = PAUSE_MODE_PROCESS

func _process(delta):
	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen