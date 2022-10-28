extends Node

class_name TitleScreen

onready var MAIN: Control = $Main
onready var NEW_GAME: Control = $NewGame
onready var CUSTOMISE: Control = $CustomiseCharacter

# Called when the node enters the scene tree for the first time.
func _ready():
	# Global.switch_scene(Levels.lookup("outside"))
	change_menu("main")

func change_menu(name):
	
	MAIN.visible = false
	NEW_GAME.visible = false
	CUSTOMISE.visible = false
	
	if(name == "main"):
		MAIN.visible = true
	elif(name == "newgame"):
		NEW_GAME.visible = true
	if(name == "customise"):
		CUSTOMISE.visible = true
