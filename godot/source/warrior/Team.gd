extends "res://source/warrior/Code.gd"

var team1 = {
	"color": Color(""), # purple
	"layer": 1024
}

var team2 = {
	"color": Color(""), # red
	"layer": 2048
}

func set_team(team_name):
	call_deferred("_set_team", team_name)

func _set_team(team_name):
	var team = get(team_name.to_lower())
	_set_layer(team.layer)
	_replace_color(team.color) 

func _set_layer(layer):
	warrior.hit_area.collision_layer = layer

func _replace_color(color):
	pass