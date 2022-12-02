extends Control

onready var Animator = $AnimationPlayer

func _on_Lost_visibility_changed():
	if visible:
		Animator.stop(true)
		Animator.play("slide in")
	pass

func _on_MainMenuButton_pressed():
	Clock.reset()
	get_tree().change_scene("res://gui/roots/title/Title.tscn")
	pass

