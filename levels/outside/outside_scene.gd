extends Node2D

onready var Map: TileMap = $TileMap

var time: float = 0

func _ready():
	QuestManager.dump()
	var quest_in = WatchBirdsQuest.new(QuestManager.QuestTypes.STUDY)
	QuestManager.register_quest(quest_in, QuestManager.QuestTypes.STUDY)
	quest_in.prepare_q()
	quest_in.start_q()
	Clock.pause(false)
	# in and out are the same!
	# the first objective has now started successfully
	# updating finished=true on this object (quest_in / get_quest(0,0)) updates in the manager
	# dumping before and after proves the update
	
	GUI.HUD.visible = true
	pass # Replace with function body.

func _physics_process(delta):
	time += delta
	Map.material.set_shader_param("temperature", sin(time));

func is_pausable():
	return true
