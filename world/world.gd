extends Node2D

onready var Map: TileMap = $TileMap
onready var Modulate: CanvasModulate = $Modulate
onready var Player = $Player

export var DAY_COLOUR: Color = Color.white
export var NIGHT_COLOUR: Color = Color(0,0,153/255, 1)

var time: float = 0

func _ready():
	# add_child(Player)
	Player.CAMERA.current = true
	
	QuestManager.dump()
	var birds_quest = WatchBirdsQuest.new(QuestManager.QuestTypes.STUDY)
	QuestManager.add_quest(birds_quest)
	var feed_quest = FeedCrackheadsQuest.new(QuestManager.QuestTypes.STUDY)
	QuestManager.add_quest(feed_quest)
	
	birds_quest.i__start_quest()
	Clock.pause(false)
	# in and out are the same!
	# the first objective has now started successfully
	# updating finished=true on this object (quest_in / get_quest(0,0)) updates in the manager
	# dumping before and after proves the update
	
	QuestManager.dump()
	
	GUI.HUD.visible = true
	pass # Replace with function body.

func _physics_process(delta):
	time += delta
	# Map.material.set_shader_param("temperature", WeatherManager.get_temperature_noise());

func _process(_delta):
	var blend = -cos(Clock.get_total_mins() * (2*PI)/(60 * 24))
	var blend_m = 0.6 + (0.4 * blend)
	Modulate.color = NIGHT_COLOUR.linear_interpolate(DAY_COLOUR, blend_m)
	#print(Modulate.color)
	#print(blend_m)

func is_pausable():
	return true