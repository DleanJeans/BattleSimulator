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
	
	var color
	match warrior.team:
		Const.TEAM_RED: color = Const.RED
		Const.TEAM_PURPLE: color = Const.PURPLE
	
	modulate = color
	
	if warrior.is_leader():
		rect_scale *= 1.5
		

func _on_health_changed(health):
	show()
	value = health
	_fix_weird_gui_bug()
	
func _fix_weird_gui_bug():
	if warrior.is_leader() and value <= 2:
		value = 3