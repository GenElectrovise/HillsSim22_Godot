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
	if CurrentScene.has_method("is_pausable"):
		return CurrentScene.is_pausable()
	return false

func switch_scene(path):
	print("Deferring switch to ", path)
	call_deferred("_deferred_switch_scene", path) # Defer until safe

func _deferred_switch_scene(path):
	print("Switching to ", path)
	CurrentScene.free() # It is now safe to remove the current scene
	var s = ResourceLoader.load(path) # Load the new scene.
	CurrentScene = s.instance() # Instance the new scene.
	get_tree().get_root().add_child(CurrentScene) # Add it to the active scene, as child of root.
	get_tree().set_current_scene(CurrentScene) # Optionally, to make it compatible with the SceneTree.change_scene() API.
