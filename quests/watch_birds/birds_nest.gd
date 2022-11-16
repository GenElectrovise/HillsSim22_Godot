class_name BirdsNest extends Sprite

signal on_birds_watched

var hovered = false

func _init():
	print("init birdsnest")

func _ready():
	print("nest ready")

func _physics_process(_delta):
	if Input.is_action_just_pressed("player_interact") && hovered:
		push_warning("Not checking player distance interact!")
		emit_signal("on_birds_watched")

func _on_Area2D_area_entered(area):
	if area.name == "PlayerInteractArea":
		hovered = true
	pass 

func _on_Area2D_area_exited(area):
	if area.name == "PlayerInteractArea":
		hovered = false
	pass 
