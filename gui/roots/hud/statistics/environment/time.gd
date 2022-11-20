extends Label

func _physics_process(_delta):
	text = Clock.get_formatted()
