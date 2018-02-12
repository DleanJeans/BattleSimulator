extends "res://source/warrior/animations/AnimationPlayer.gd"

func _on_Warrior_got_hit(me, weapon):
	play("Hit")
	if not warrior.is_player() and has_node("/root/Battlefield") and randf() < 0.25:
			return
	$HitSound.play()