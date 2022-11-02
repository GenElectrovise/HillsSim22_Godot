extends Node

class_name HUD

onready var Items: Control = $Items
onready var QuestsButton: Control = $Items/QuestsButton
onready var Menus: Control = $Menus
onready var QuestsWidget: Control = $Menus/QuestsWidget

func _ready():
	Items.visible = true
	show_quests(false)

func close_menu():
	show_quests(false)

func show_quests(show: bool):
	if show:
		Items.visible = false
		Menus.visible = true
		QuestsWidget.visible = true
	else:
		Items.visible = true
		Menus.visible = false
		QuestsWidget.visible = false

func _on_QuestsButton_button_up():
	show_quests(true)
	pass 
