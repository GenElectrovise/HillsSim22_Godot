extends Node

# Persistent values for the player

# inventory
# health
# depression

export (int, 0, 100, 1) var charisma: int = 25
export (int, 0, 100, 1) var concentration: int = 50
export (int, 0, 100, 1) var happiness: int = 75
export (int, 0, 100, 1) var intelligence: int = 100

# The position of the player. Updated infrequently but can be used during teleports.
var position: Vector2
var has_stash = false;

func stash(player):
	has_stash = true
	position = player.position

func regenerate(player):
	player.position = position

func to_string():
	return str("PlayerData: has_stash=", has_stash, " position=", position)
