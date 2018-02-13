extends Node

func _ready():
	$InGame.play(Game.last_music_position)
	$Mechanics/WinState/VolumeSlide.play_backwards(".")
	get_tree().paused = true
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().paused = false

func _exit_tree():
	Game.last_music_position = $InGame.get_playback_position()