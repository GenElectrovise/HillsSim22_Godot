extends KinematicBody2D

class_name Player

const reach = 10
const POINTER_ARROW = preload("res://entities/pointer_arrow/pointer_arrow.tscn")

onready var COSTUME: Costume = $PlayerCostume

var velocity : Vector2 = Vector2()
var direction = Direction.SOUTH
var movement_enabled = true setget set_movement_enabled
var interaction_enabled = true setget set_interaction_enabled

enum Direction {
	NORTH, SOUTH, EAST, WEST
}

func _ready():
	if(PlayerData.has_stash):
		call_deferred("regenerate_from_player_data")
	COSTUME.reset()

func handle_input():
	handle_movement_input()
	handle_interaction_input()

func handle_movement_input():
	if !movement_enabled:
		return
	velocity = Vector2.ZERO
	if(Input.is_action_pressed("player_north")):
		velocity.y -= 1
	elif(Input.is_action_pressed("player_south")):
		velocity.y += 1
	elif(Input.is_action_pressed("player_east")):
		velocity.x += 1
	elif(Input.is_action_pressed("player_west")):
		velocity.x -= 1
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 100)

func handle_interaction_input():
	if !interaction_enabled:
		return
	if(Input.is_action_just_pressed("player_interact")):
		print("Trying to interact")
		attempt_interact()

func look_at_mouse():
	look_at(get_global_mouse_position())
	rotation_degrees = rotation_degrees + 90

func _physics_process(_delta):
	handle_input()
	# look_at_mouse()

func attempt_interact():
	var point = get_global_mouse_position()
	var arrow = POINTER_ARROW.instance()
	arrow.initialize(point)
	add_child(arrow)
		
func regenerate_from_player_data():
	PlayerData.regenerate(self)

func set_movement_enabled(enabled: bool):
	print("movement_enabled: ", enabled)
	movement_enabled = enabled

func set_interaction_enabled(enabled: bool):
	print("interaction_enabled: ", enabled)
	interaction_enabled = enabled
