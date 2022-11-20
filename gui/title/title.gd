extends Node

onready var TITLE_SCREEN = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_NewGameButton_pressed():
	TITLE_SCREEN.change_menu("newgame")
	pass 
