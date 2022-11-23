extends Node2D

onready var Hud: HUD = $HUD
onready var Modulate: CanvasModulate = $Modulate
onready var Player = $Player

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

func is_pausable():
	return true

func you_survived_hills_road():
	print("You survived!")
	get_tree().change_scene("res://gui/roots/survived/Survived.tscn")

func _on_region_entered(region_name: String, has_loading_screen: bool):
	print("World > Entered Region: ", region_name)
	
	if has_loading_screen:
		print("World > Loading ", region_name)
		get_tree().paused = true
		
		Hud.HUDAnimator.play("Show Loading Screen")
		yield(Hud.HUDAnimator, "animation_finished")
		Hud.HUDAnimator.play_backwards("Show Loading Screen")
		yield(Hud.HUDAnimator, "animation_finished")
		
		get_tree().paused = false
		print("World > Done loading ", region_name)
	pass
