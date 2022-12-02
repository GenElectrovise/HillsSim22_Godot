extends Control

signal make_new_game

func _on_NewGameButton_pressed():
	emit_signal("make_new_game")
	pass
