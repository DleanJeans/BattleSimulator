extends Node

static func get_position(node):
	if node == null:
		return Vector2()
	if typeof(node) == TYPE_VECTOR2:
		return node
	return node.global_position