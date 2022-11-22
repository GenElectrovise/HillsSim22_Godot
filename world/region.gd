extends Area2D

export (String) var valid_area_name = "PlayerArea"
export (String) var region_name = "Region"
signal region_entered(region_name)

func _on_Region_area_entered(area):
	if area.name == valid_area_name:
		print(valid_area_name, " entered Region: ", region_name, ": ", self)
		emit_signal("region_entered")
		WorldState.current_region = region_name
