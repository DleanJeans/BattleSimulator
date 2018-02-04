extends "res://source/warrior/animations/AnimationPlayer.gd"

func _on_Warrior_got_hit(me, weapon):
	play("Hit")