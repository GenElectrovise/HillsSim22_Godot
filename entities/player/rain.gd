extends Particles2D

export (bool) var force = false
export (bool) var allowed = false

func _process(_delta):
	if (allowed and WeatherManager.is_raining()) or force:
		emitting = true
	else:
		emitting = false
	pass 
