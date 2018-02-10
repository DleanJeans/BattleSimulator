extends Node

const UP = Vector2(0, -1)
const DOWN = Vector2(0, 1)
const LEFT = Vector2(-1, 0)
const RIGHT = Vector2(1, 0)

const WARRIOR_AI = "WarriorAI"
const TROOP_AI = "TroopAI"

const TEAM_RED = "TeamRed"
const TEAM_PURPLE = "TeamPurple"

func get_enemy_team(friendly_team):
	match friendly_team:
		TEAM_RED: return TEAM_PURPLE
		TEAM_PURPLE: return TEAM_RED