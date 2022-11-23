extends Node

class_name HUD

onready var HUDAnimator: AnimationPlayer = $HUDAnimator
onready var Items: Control = $Statistics
onready var Quests: Control = $Quests

func _ready():
	Items.visible = true
	show_quests(false)

func show_quests(show: bool):
	if show:
		Items.visible = false
		Quests.visible = true
	else:
		Items.visible = true
		Quests.visible = false

func s__show_quests():
	show_quests(true)
	pass 

func s__hide_quests():
	show_quests(false)
	pass 
