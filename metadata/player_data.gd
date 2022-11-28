extends Node

# Persistent values for the player

# inventory
# health
# depression

var stash_dirty: bool = false setget , is_stash_dirty
var has_stash: bool = false setget , get_has_stash

export (int, 0, 100, 1) var charisma: int = 25 setget set_charisma, get_charisma
export (int, 0, 100, 1) var concentration: int = 50 setget set_concentration, get_concentration
export (int, 0, 100, 1) var happiness: int = 75 setget set_happiness, get_happiness
export (int, 0, 100, 1) var intelligence: int = 100 setget set_intelligence, get_intelligence
var inventory = load("res://inventory/inventory.gd").new()

var position: Vector2 setget set_position, get_position
var reach: float setget set_reach, get_reach

func _physics_process(delta):
	if Input.is_action_just_pressed("debug"):
		print("Adding item to playerdata inv")
		if randf() > 0.5:
			print("Adding ")
			var item_instance = load("res://inventory/ExclamationItem.tres")
			inventory.add_item(item_instance)
		else:
			var i = randi() % 8
			print("Removing ", i)
			inventory.remove_item(i)

func push(player):
	has_stash = true
	position = player.position
	reach = 100

func pop(player):
	player.position = position

func to_string():
	return str("PlayerData: has_stash=", has_stash, " position=", position)

# setget
func is_stash_dirty() -> bool:
	return stash_dirty
func make_dirty():
	stash_dirty = true

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
