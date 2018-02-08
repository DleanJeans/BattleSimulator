extends AnimationPlayer

onready var animation_center = get_parent()
onready var warrior = get_parent().get_parent()

func _ready():
	playback_speed = rand_range(0.9, 1.1)

func _playing(animation):
	return is_playing() and current_animation == animation

func _not_playing(animation):
	return not _playing(animation)