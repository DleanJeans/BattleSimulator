tool
extends "res://source/warrior/Code.gd"

var TeamRed = {
	"color": Color("#f05724"), # red
	"layer": 1024
}

var TeamPurple = {
	"color": Color("#9b24f0"), # purple
	"layer": 2048
}

func set_team(team_name):
	call_deferred("_set_team", team_name)

func _set_team(team_name):
	var team = get(team_name)
	
	_set_group(team_name)
	_set_layer(team.layer)
	_change_color_for_team_purple(team_name) 

func _set_group(team_name):
	warrior.add_to_group(team_name)

func _set_layer(layer):
	warrior.hit_area.collision_layer = layer

func _change_color_for_team_purple(team_name):
	sprite.use_parent_material = team_name == "TeamPurple"