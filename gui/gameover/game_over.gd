extends Node

class_name GameOver

onready var SURVIVED: Control = $Survived
onready var LOST: Control = $Lost

var message = "rip bozo"

func _ready():
	change_menu("survived")

func change_menu(name):
	SURVIVED.visible = true if name == "survived" else false
	LOST.visible = true if name == "lost" else false
