extends Node

# Persistent values for the player

# inventory
# health
# depression

export (float, 0, 100, 1) var charisma = 25
export (float, 0, 100, 1) var concentration = 50
export (float, 0, 100, 1) var happiness = 75
export (float, 0, 100, 1) var intelligence = 100

# The position of the player. Updated infrequently but can be used during teleports.
#var position: Vector2
#var has_stash = false;

#func stash(player):
#	print("Stashing player data for ", player)
#	has_stash = true
#	position = player.position
#
#	print(to_string())
#
#func regenerate(player):
#	print("Regenerating player data from ", to_string())
#	player.position = position
#
#func to_string():
#	return str("PlayerData: has_stash=", has_stash, " position=", position)
