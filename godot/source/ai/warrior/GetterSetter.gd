extends Node

var _character

func get_character():
	if _character != null:
		return _character
	
	var character_path = get_parent().character_path

	if character_path == null:
		return null
	_character = get_node(character_path)
	return _character

func set_character(character):
	var parent = get_parent()
	
	if character.is_inside_tree():
		character.connect("died", parent, "queue_free")
		parent.character_path = character.get_path()
		parent.add_to_group(character.team + "WarriorAI")
	else:
		print("Cannot set character: Character is not in scene tree!")
		print_stack()

func get_node(path):
	return get_parent().get_node(path)