extends Node

# Persistent values for the player

# inventory
# health
# depression

export (int, 0, 100, 1) var charisma: int = 25 setget set_charisma, get_charisma
export (int, 0, 100, 1) var concentration: int = 50 setget set_concentration, get_concentration
export (int, 0, 100, 1) var happiness: int = 75 setget set_happiness, get_happiness
export (int, 0, 100, 1) var intelligence: int = 100 setget set_intelligence, get_intelligence

var has_stash: bool = false setget , get_has_stash

var position: Vector2 setget set_position, get_position
var reach: float setget set_reach, get_reach

func stash(player):
	has_stash = true
	position = player.position
	reach = 100

func regenerate(player):
	player.position = position

func to_string():
	return str("PlayerData: has_stash=", has_stash, " position=", position)

# setget

func get_has_stash() -> bool:
	return has_stash

func set_charisma(charisma_in: int):
	charisma = charisma_in
func get_charisma() -> int:
	return charisma
func set_concentration(concentration_in: int):
	concentration = concentration_in
func get_concentration() -> int:
	return concentration
func set_happiness(happiness_in: int):
	happiness = happiness_in
func get_happiness() -> int:
	return happiness
func set_intelligence(intelligence_in: int):
	intelligence = intelligence_in
func get_intelligence() -> int:
	return intelligence

func set_position(position_in: Vector2):
	position = position_in
func get_position() -> Vector2:
	return position

func set_reach(reach_in: float):
	reach = reach_in
func get_reach() -> float:
	return reach
