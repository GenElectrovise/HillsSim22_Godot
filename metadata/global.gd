extends Node

onready var CurrentScene = $CurrentScene
var random: RandomNumberGenerator

var SEED = 0

func _init():
	CurrentScene = null
	random = RandomNumberGenerator.new()
	SEED = random.randi()
	random.seed = SEED
	random.randomize()

func _ready():
	var root = get_tree().get_root()
	CurrentScene = root.get_child(root.get_child_count() - 1)#

func is_pausable() -> bool:
	#if CurrentScene.has_method("is_pausable"):
	#	return CurrentScene.is_pausable()
	if get_tree().current_scene.has_method("is_pausable"):
		return get_tree().current_scene.is_pausable()
	return false
