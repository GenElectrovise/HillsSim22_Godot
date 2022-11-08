class_name BirdsNest extends Sprite

signal on_birds_watched

func _on_Area2D_area_entered(area):
	if area.name == "PlayerInteractArea":
		emit_signal("on_birds_watched")
	pass 
