class_name BirdsNest extends Sprite

signal on_birds_watched

var hovered = false


func _on_Area2D_area_entered(area):
	print("Entered Area2D ", self)
	if area.name == "PlayerInteractArea":
		emit_signal("on_birds_watched")
	pass 


func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event.type == InputEvent.MOUSE_BUTTON && event.pressed):
		emit_signal("on_birds_watched", position)
		# Need instance of player to check distance?
	pass


func _on_Area2D_mouse_entered():
	hovered = true
	pass


func _on_Area2D_mouse_exited():
	hovered = false
	pass
