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
			$AgainButton.show()
			return
	
	$NextButton.show()
	$NextButton.grab_focus()

func lose():
	$Label.text = "DEFEAT!"
	$AgainButton.show()
	$AgainButton.grab_focus()
	$DamageBonus.hide()

func _on_AgainButton_pressed():
	if Scene.level == 3:
		Scene.level = 1
	get_tree().change_scene("res://source/scenes/Battlefield.tscn")
	get_tree().paused = false

func _on_NextButton_pressed():
	Scene.level += 1
	get_tree().change_scene("res://source/scenes/Battlefield.tscn")
	get_tree().paused = false

func _on_MainMenu_pressed():
	get_tree().change_scene("res://source/scenes/TeamChoosing.tscn")
	Scene.level = 1
