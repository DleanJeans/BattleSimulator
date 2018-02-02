extends AnimationPlayer

onready var warrior = get_parent().get_parent()

func _playing(animation):
	return is_playing() and current_animation == animation

func _not_playing(animation):
	return not _playing(animation)