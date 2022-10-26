extends Node2D

onready var area = $Area2D
onready var teleport = $TeleportSprite


class_name Teleporter

const DARK = Color(0.5, 0.5, 0.5)
const LIGHT = Color(1, 1, 1)
const Levels = preload("res://levels/levels.gd")

# Implementers should also export
export(String) var destination_level = ""
export(Vector2) var destination_position = Vector2.ZERO

var font
var entering_entity
var player_in_area = false
var is_hovered = false
var cooldown = 0

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
	cooldown = max(0, cooldown - delta)

func _on_Area2D_area_entered(area_e):
	if(area_e.get_parent() is Player):
		player_in_area = true
		entering_entity = area_e.get_parent()

func _on_Area2D_area_exited(area_e):
	if(area_e.get_parent() is Player):
		player_in_area = false
		entering_entity = null

func teleport(entity):
	if(cooldown > 0):
		print("Teleport is on cooldown (cooldown=", cooldown, ")")
		pass
	if(entity is Player && cooldown <= 0):
		print("Teleporting ", entity, " to ", destination_level, ":", destination_position)
		var lvl = Levels.lookup(destination_level)
		print("(Destination level, '", destination_level, "', is '", lvl, "')")
		Global.switch_scene(lvl)
		entity.position = destination_position
		PlayerData.stash(entity as Player)
		cooldown = 2
		
	else:
		print("Failed to teleport ", entity, " cooldown=", cooldown)

func _on_Area2D_mouse_entered():
	is_hovered = true

func _on_Area2D_mouse_exited():
	is_hovered = false

func _on_Area2D_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(is_hovered):
			teleport(entering_entity)
