extends Control

signal show_quests

func _on_QuestsButton_pressed():
	emit_signal("show_quests")
	pass
