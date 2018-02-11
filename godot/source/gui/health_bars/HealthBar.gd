extends ProgressBar

var warrior

func _process(delta):
	_update_position()

func _update_position():
	if warrior != null:
		rect_global_position = warrior.global_position - rect_pivot_offset

func set_warrior(warrior):
	self.warrior = warrior
	warrior.connect("health_changed", self, "_on_health_changed")
	warrior.connect("died", self, "queue_free")

func _on_health_changed(health):
	value = health