extends KinematicBody2D

class_name Player

var velocity : Vector2 = Vector2()
const reach = 10
onready var COSTUME: Costume = $Costume

const POINTER_ARROW = preload("res://entities/pointer_arrow/pointer_arrow.tscn")

func _ready():
	if(PlayerData.has_stash):
		call_deferred("regenerate_from_player_data")
	COSTUME.reset()

func handle_input():
	velocity = Vector2.ZERO
	
	if(Input.is_action_pressed("player_north")):
		velocity.y -= 1
	if(Input.is_action_pressed("player_east")):
		velocity.x += 1
	if(Input.is_action_pressed("player_south")):
		velocity.y += 1
	if(Input.is_action_pressed("player_west")):
		velocity.x -= 1#
	if(Input.is_action_just_pressed("player_interact")):
		print("Trying to interact")
		attempt_interact()
		
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 100)

func look_at_mouse():
	look_at(get_global_mouse_position())
	rotation_degrees = rotation_degrees + 90

func _physics_process(delta):
	handle_input()
	# look_at_mouse()

func attempt_interact():
	var point = get_global_mouse_position()
	var arrow = POINTER_ARROW.instance()
	arrow.initialize(point)
	add_child(arrow)
		
func regenerate_from_player_data():
	PlayerData.regenerate(self)
