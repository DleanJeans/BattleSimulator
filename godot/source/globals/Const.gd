extends Node

const UP = Vector2(0, -1)
const DOWN = Vector2(0, 1)
const LEFT = Vector2(-1, 0)
const RIGHT = Vector2(1, 0)

const WARRIOR_AI = "WarriorAI"
const SQUAD_AI = "SquadAI"

const TEAM_RED = "TeamRed"
const TEAM_PURPLE = "TeamPurple"

var RED = Color("#F2460D")
var PURPLE = Color("#930DF2")

func get_enemy_team(friendly_team):
	match friendly_team:
		TEAM_RED: return TEAM_PURPLE
		TEAM_PURPLE: return TEAM_RED