extends Node

class_name GameOver

onready var SURVIVED: Control = $Survived

# Called when the node enters the scene tree for the first time.
func _ready():
	change_menu("main")

func change_menu(name):
	
	SURVIVED.visible = true if name == "main" else false
