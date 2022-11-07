extends Label

func _physics_process(delta):
	text = str(WeatherManager.get_temperature())
