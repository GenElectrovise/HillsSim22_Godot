extends Node

signal start_new_game

func _on_CustomiseCharacterButton_pressed():
	emit_signal("start_new_game")
	pass
