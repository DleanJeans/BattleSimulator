extends Sprite

export(NodePath) var player_path setget set_player_path

var _character

func _process(delta):
	if _character != null:
		global_position = _character.global_position
		if _character.is_dead():
			hide()

func set_player(player):
	set_player_path(player.get_path())

func set_player_path(path):
	if path == null: return
	
	player_path = path
	if not is_inside_tree():
		yield(self, "tree_entered")
	_character = get_node(path)