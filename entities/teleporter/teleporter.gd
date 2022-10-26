extends Node2D

onready var area = $Area2D
onready var teleport = $TeleportSprite

const DARK = Color(0.5, 0.5, 0.5)
const LIGHT = Color(1, 1, 1)
	
class_name Teleporter

var destination_level
var destination_position

var font
var entering_entity
var player_in_area = false
var is_hovered = false

func _ready():
	teleport.visible = true
	teleport.self_modulate = DARK
	entering_entity = null
	player_in_area = false
	is_hovered = false
	update()

func _physics_process(delta):
	if(is_hovered):
		teleport.visible = true
		teleport.set_position(get_global_mouse_position())
	else:
		teleport.visible = false
	
	if(player_in_area):
		teleport.self_modulate = LIGHT
	else:
		teleport.self_modulate = DARK

func _on_Area2D_area_entered(area_e):
	if(area_e.get_parent() is Player):
		print("Entity entered area of teleporter")
		player_in_area = true
		entering_entity = area_e.get_parent()

func _on_Area2D_area_exited(area_e):
	if(area_e.get_parent() is Player):
		print("Entity left area of teleporter")
		player_in_area = false
		entering_entity = null

func teleport(player):
	if(player is Player):
		player.position = Vector2.ZERO

func _on_Area2D_mouse_entered():
	is_hovered = true

func _on_Area2D_mouse_exited():
	is_hovered = false

func _on_Area2D_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(is_hovered):
			teleport(entering_entity)
