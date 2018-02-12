extends CanvasLayer

func _ready():
	yield(get_tree().create_timer(0.5),"timeout")
	get_tree().paused = true

func win():
	$Label.text = "VICTORY!"
	
	match Scene.level:
		1: $DamageBonus.show()
		2:
			$DamageBonus2.show()
			if Scene.player_team == Const.TEAM_RED:
				$DamageBonus2/Warrior.use_parent_material = true
		3:
			$Thanks.show()
			return
	
	yield(get_tree().create_timer(1), "timeout")
	$Buttons/NextButton.show()
	$Buttons/NextButton.grab_focus()
	$Buttons/AgainButton.show()

func lose():
	$Label.text = "DEFEAT!"
	$DamageBonus.hide()
	
	yield(get_tree().create_timer(1), "timeout")
	$Buttons/AgainButton.show()
	$Buttons/AgainButton.grab_focus()

func _on_AgainButton_pressed():
	if Scene.level == 3:
		Scene.level = 1
	get_tree().change_scene(Scene.BattlefieldPath)
	get_tree().paused = false

func _on_NextButton_pressed():
	Scene.level += 1
	get_tree().change_scene(Scene.BattlefieldPath)
	get_tree().paused = false

func _on_MainMenu_pressed():
	get_tree().change_scene(Scene.TeamChoosingPath)
	Scene.level = 1
