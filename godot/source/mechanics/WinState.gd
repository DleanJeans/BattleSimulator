extends Node

func _ready():
	for warrior in get_tree().get_nodes_in_group("Warriors"):
		warrior.connect("died", self, "_check_win_state")

func _check_win_state():
	var player_team = Game.player_team
	var enemy_team = Const.get_enemy_team(player_team)
	
	var enemies = get_tree().get_nodes_in_group(enemy_team).size()
	if enemies == 0:
		_open_battle_over_screen(true)
	
	var teammates = get_tree().get_nodes_in_group(player_team).size()
	if teammates == 0:
		_open_battle_over_screen(false)

func _open_battle_over_screen(win):
	if has_node("BattleOverScreen"):
		print("Already has a BattleOverScreen! Cancelling...")
		return
	
	var battle_over_screen = Scene.BattleOverScreen.instance()
	add_child(battle_over_screen)
	if win:
		battle_over_screen.win()
		$Victory.play()
	else:
		battle_over_screen.lose()
		$Defeat.play()
	$VolumeSlide.play(".")