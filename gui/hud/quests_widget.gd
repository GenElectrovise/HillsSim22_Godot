extends Control

class_name QuestsWidget

var show_box = false

onready var QuestButton = $QuestButton
onready var QuestBox = $QuestBox

func _ready():
	pass # Replace with function body.

func _process(delta):
	if show_box:
		QuestBox.visible = true
		QuestButton.visible = false
	else:
		QuestBox.visible = false
		QuestButton.visible = true

func _on_QuestButton_button_up():
	show_box = true
	pass
