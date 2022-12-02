class_name Player extends KinematicBody2D

const reach = 10
const POINTER_ARROW = preload("res://entities/pointer_arrow/pointer_arrow.tscn")

var COSTUME: Costume
onready var CAMERA: Camera2D = $PlayerCamera
onready var effect_manager: EffectManager = $EffectManager 

var velocity : Vector2 = Vector2()
var direction = Direction.SOUTH
var movement_enabled = true setget set_movement_enabled
var interaction_enabled = true setget set_interaction_enabled

signal player_died(message)

enum Direction {
	NORTH, SOUTH, EAST, WEST
}

func _ready():
	COSTUME = get_node("PlayerCostume")
	COSTUME.set_all("generic")
	CAMERA.add_to_group("cameras")

func handle_input():
	handle_movement_input()

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
	
	if(Input.is_action_just_pressed("use_item_1")):
		use_item(0)
	elif(Input.is_action_just_pressed("use_item_2")):
		use_item(1)
	elif(Input.is_action_just_pressed("use_item_3")):
		use_item(2)
	elif(Input.is_action_just_pressed("use_item_4")):
		use_item(3)
	elif(Input.is_action_just_pressed("use_item_5")):
		use_item(4)
	elif(Input.is_action_just_pressed("use_item_6")):
		use_item(5)
	elif(Input.is_action_just_pressed("use_item_7")):
		use_item(6)
	elif(Input.is_action_just_pressed("use_item_8")):
		use_item(7)
	elif(Input.is_action_just_pressed("use_item_9")):
		use_item(8)
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 100)

func use_item(index: int):
	print("Player using item ", index)
	print("HURTING")
	hurt(DamageSource.new(DamageSource.DamageType.FIRE, 1))
	PlayerData.inventory.remove_item(index)
	pass

func _physics_process(_delta):
	if PlayerData.is_stash_dirty():
		PlayerData.pop(self)
	handle_input()
	PlayerData.push(self)

func hurt(source: DamageSource):
	emit_signal("player_died", "Hills Road claimed your soul.")
	print("Game Over!")
	get_tree().change_scene("res://gui/roots/lost/Lost.tscn")
	pass

func set_movement_enabled(enabled: bool):
	print("movement_enabled: ", enabled)
	movement_enabled = enabled

func set_interaction_enabled(enabled: bool):
	print("interaction_enabled: ", enabled)
	interaction_enabled = enabled


