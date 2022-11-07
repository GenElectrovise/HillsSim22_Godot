extends ColorRect

func _ready():
	color = Color.white
	color.a = 0
	pass 

func _physics_process(delta):
	update_tint()

func update_tint():
	
	if !GUI.visible:
		color.a = 0
		return
	
	
	var tint = Color.cyan
	tint.a = 0.05
	return tint
