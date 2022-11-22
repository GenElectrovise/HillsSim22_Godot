extends Label

func _physics_process(_delta):
	text = str("Tmp:", WeatherManager.get_temperature())
