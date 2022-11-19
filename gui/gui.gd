extends Control

onready var HUD: HUD = $Base/HUD
onready var Pause = $Base/Pause

var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	HUD.visible = false
	# Pause.visible # Sets itself
	pass 
