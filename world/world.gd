extends Node2D

onready var Modulate: CanvasModulate = $Modulate
onready var Player = $Player

export var DAY_COLOUR: Color = Color.white
export var NIGHT_COLOUR: Color = Color(0,0,153/255, 1)

var current_region: String

var time: float = 0

func _ready():
	Player.CAMERA.current = true
	
	QuestManager.dump()
	var birds_quest = WatchBirdsQuest.new(QuestManager.QuestTypes.STUDY)
	QuestManager.add_quest(birds_quest)
	var feed_quest = FeedCrackheadsQuest.new(QuestManager.QuestTypes.STUDY)
	QuestManager.add_quest(feed_quest)
	
	birds_quest.i__start_quest()
	Clock.pause(false)
	
	QuestManager.dump()
	
	# GUI.HUD.visible = true
	pass

func _physics_process(delta):
	time += delta
	if Clock.season >= 8:
		you_survived_hills_road()

func _process(_delta):
	var blend = -cos(Clock.get_total_mins() * (2*PI)/(60 * 24))
	var blend_m = 0.6 + (0.4 * blend)
	Modulate.color = NIGHT_COLOUR.linear_interpolate(DAY_COLOUR, blend_m)

func is_pausable():
	return true

func you_survived_hills_road():
	print("You survived!")
	get_tree().change_scene("res://gui/roots/survived/Survived.tscn")

