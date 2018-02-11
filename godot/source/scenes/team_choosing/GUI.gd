extends Container

export(NodePath) var player_control_path
export(NodePath) var team_red_path
export(NodePath) var team_purple_path

onready var player_control = get_node(player_control_path)
onready var team_red = get_node(team_red_path)
onready var team_purple = get_node(team_purple_path)

func _on_ButtonRed_pressed():
	$ButtonRed.hide()
	$ButtonPurple.show()
	$Instructions.show()
	
	player_control.set_player(team_red)
	team_red.attack()
	_start_instructions_flickering()
	$HealthBars.show()

func _on_ButtonPurple_pressed():
	$ButtonPurple.hide()
	$ButtonRed.show()
	$Instructions.show()
	
	player_control.set_player(team_purple)
	team_purple.attack()
	_start_instructions_flickering()
	$HealthBars.show()

func _start_instructions_flickering():
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("Flicker")