extends Label

func _physics_process(_delta):
	text = str("Reg:", WorldState.current_region.name)
