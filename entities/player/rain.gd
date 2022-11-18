extends Particles2D

func _process(_delta):
	if WeatherManager.is_raining():
		amount = 300
	else:
		 amount = 0
	pass 
