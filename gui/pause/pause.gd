extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var paused = false setget set_paused

# Called when the node enters the scene tree for the first time.
func _ready():
	set_paused(false)
	pass

func _unhandled_input(event):
	if Global.is_pausable():
		if event.is_action_pressed("pause"):
			self.paused = !paused

func set_paused(pause: bool):
	print("Paused: ", pause)
	paused = pause
	get_tree().paused = paused
	visible = paused

func _on_QuitButton_pressed():
	get_tree().quit()
	pass

func _on_ResumeButton_pressed():
	set_paused(false)
	pass


func _on_OptionsButton_pressed():
	print("Options menu not implemented yet :(")
	pass
