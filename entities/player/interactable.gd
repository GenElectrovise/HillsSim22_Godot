extends Area2D

export (bool) var enforce_player_reach = true

signal on_interact()
signal hover_changed(now_hovered)

func _on_Interactable_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		attempt_interact()
	pass

func attempt_interact():
	if can_player_interact():
		emit_signal("on_interact")

func can_player_interact() -> bool:
	if enforce_player_reach:
		var distance = position.distance_to(PlayerData.position)
		print(distance)
		if distance > PlayerData.get_reach():
			return false
	
	#var space_state = get_world_2d().direct_space_state
	#var sight_check = space_state.intersect_ray(position, PlayerData.position, [self])
	push_warning("Ignoring line of sight concerns for Interactable")
	return true

func _on_Interactable_mouse_entered():
	emit_signal("hover_changed", true)
	pass

func _on_Interactable_mouse_exited():
	emit_signal("hover_changed", false)
	pass
