extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var HUD: HUD = $Base/HUD
onready var Pause = $Base/Pause

# Called when the node enters the scene tree for the first time.
func _ready():
	HUD.visible = false
	# Pause.visible # Sets itself
	pass 
