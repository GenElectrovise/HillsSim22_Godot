extends Node

var random: RandomNumberGenerator

var SEED = 0

func _init():
	random = RandomNumberGenerator.new()
	SEED = random.randi()
	random.seed = SEED
	random.randomize()

func is_pausable() -> bool:
	if get_tree().current_scene.has_method("is_pausable"):
		return get_tree().current_scene.is_pausable()
	return false
