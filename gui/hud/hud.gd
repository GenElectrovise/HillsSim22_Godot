extends Node

class_name HUD

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var show_quests = false

onready var Quests: QuestsWidget = $QuestsWidget

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_QuestButton_button_down():
	show_quests = !show_quests
	pass
