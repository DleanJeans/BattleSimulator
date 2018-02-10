extends Area2D

export(int) var damage = 1
export(bool) var shape_enabled = false setget set_shape_enabled

func _on_area_entered(area):
	self.shape_enabled = false

func set_shape_enabled(enabled):
	shape_enabled = enabled
	if has_node("Shape"):
		$Shape.disabled = not enabled