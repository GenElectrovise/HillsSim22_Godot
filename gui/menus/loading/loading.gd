extends Control

func _ready():
	pass

func _on_MainMenuButton_pressed():
	Clock.reset()
	get_tree().change_scene("res://gui/roots/title/Title.tscn")
	pass
