extends CanvasLayer

func _ready():
	yield(get_tree().create_timer(0.5),"timeout")
	get_tree().paused = true

func win():
	$Label.text = "VICTORY!"
	
	match Game.level:
		1: $DamageBonuses/Level1.show()
		2:
			$DamageBonuses/Level2.show()
			if Game.player_team == Const.TEAM_RED:
				$DamageBonuses/Level2/C/Warrior.use_parent_material = true
		3:
			$Thanks.show()
			$Buttons/AgainButton.show()
			return
	
	yield(get_tree().create_timer(1), "timeout")
	$Buttons/NextButton.show()
	$Buttons/NextButton.grab_focus()
	$Buttons/AgainButton.show()

func lose():
	$Label.text = "DEFEAT!"
	$DamageBonuses.hide()
	
	yield(get_tree().create_timer(1), "timeout")
	$Buttons/AgainButton.show()
	$Buttons/AgainButton.grab_focus()

func _on_AgainButton_pressed():
	if Game.level == 3:
		Game.level = 1
	get_tree().change_scene(Scene.BattlefieldPath)
	get_tree().paused = false

func _on_NextButton_pressed():
	Game.level += 1
	get_tree().change_scene(Scene.BattlefieldPath)
	get_tree().paused = false

func _on_MainMenu_pressed():
	get_tree().change_scene(Scene.TeamChoosingPath)
	Game.level = 1
