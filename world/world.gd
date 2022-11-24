extends Node2D

onready var Hud: HUD = $HUD
onready var Modulate: CanvasModulate = $Modulate
onready var Player = $Player
onready var WorldMusic = $WorldMusicPlayer

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
		
	pass

func _physics_process(delta):
	time += delta
	if Clock.season >= 8:
		you_survived_hills_road()
		WorldMusic.stop()
	if WorldMusic.stream == null:
		_on_WorldMusicPlayer_finished()
	
	if Input.is_action_just_pressed("debug"):
		print("Debug / Music > Seeking to get_length() - 1")
		# WorldMusic.stream = null
		WorldMusic.seek(WorldMusic.stream.get_length() - 1)

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


func _on_WorldMusicPlayer_finished():
	print("Music > World music player finished")
	var selection: Array
	var day_stage = Clock.get_day_stage()
	var region: Region = WorldState.current_region
	var playlist_time: String
	if region != null:
		if (day_stage == Clock.DayStage.DAWN) or (day_stage == Clock.DayStage.DAY):
			selection = region.get_day_music() 
			playlist_time = "dawn-day"
		if (day_stage == Clock.DayStage.DUSK) or (day_stage == Clock.DayStage.NIGHT):
			selection = region.get_night_music() 
			playlist_time = "dusk-night"
		
	# Guard clause
	if (selection == null) or (selection.size() < 1):
		return
	
	randomize()
	var index = randi() % selection.size()
	var stream: AudioStream = selection[index]
	WorldMusic.stream = stream
	WorldMusic.play()
	print("Music > Starting ", WorldMusic.stream.resource_path, " from ", region.name, "/", playlist_time)
	pass
