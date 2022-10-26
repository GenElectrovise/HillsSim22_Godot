extends Node2D


var destination_level
var destination_position

var font
var entering_entity
var player_in_area = false
var is_hovered = false

onready var area = $Area2D
onready var teleport = $TeleportSprite

func _physics_process(delta):
	if(is_hovered):
		teleport.visible = true
		teleport.set_position(get_global_mouse_position())
	else:
		teleport.visible = false
	
	if(player_in_area):
		teleport.modulate = Color.white
	else:
		teleport.modulate = Color(0.5, 0.5, 0.5)

func _on_Area2D_area_entered(area_e):
	print("Entity entered area of teleporter")
	player_in_area = true
	entering_entity = area_e.get_parent()

func _on_Area2D_area_exited(area_e):
	print("Entity left area of teleporter")
	player_in_area = false
	entering_entity = null

func teleport(player):
	player.position = Vector2.ZERO


func _on_Area2D_mouse_entered():
	is_hovered = true


func _on_Area2D_mouse_exited():
	is_hovered = false


func _on_Area2D_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(is_hovered):
			teleport(entering_entity)
