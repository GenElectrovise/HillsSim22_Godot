extends Label

func _physics_process(_delta):
	text = str(WeatherManager.get_temperature())
