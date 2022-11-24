class_name Region extends Area2D

export (String) var valid_area_name = "PlayerArea"
export (String) var region_name = "DefaultRegion"
export (bool) var has_precipitation = false
export (bool) var is_air_conditioned = false
export (int) var air_temperature = 20
export (bool) var has_loading_screen = false
export (Array) var day_music = [] setget , get_day_music
export (Array) var night_music = [] setget , get_night_music
signal region_entered(region_name, has_loading_screen)

func _init():
	valid_area_name = "PlayerArea"
	region_name = "Default"
	has_precipitation = false
	is_air_conditioned = false

func _on_Region_area_entered(area):
	if area.name == valid_area_name:
		print("World > ", area.name, " is trying to change to Region: ", region_name, ": ", self)
		emit_signal("region_entered", region_name, has_loading_screen)
		WorldState.current_region = self

func get_day_music() -> Array:
	return day_music

func get_night_music() -> Array:
	return night_music
