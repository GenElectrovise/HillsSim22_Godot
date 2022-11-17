class_name Goth extends KinematicBody2D

var COSTUME: Costume

export (float, 0, 100, 0.5) var SPEED

onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

var velocity

func _init():
	pass

func _ready():
	COSTUME = get_node("Costume")
	COSTUME.set_all("goth")
	pass

func _physics_process(delta):
	navigation_agent.set_target_location(PlayerData.position)
	var direction = position.direction_to(navigation_agent.get_next_location())
	velocity = direction.normalized() * SPEED
	navigation_agent.set_velocity(velocity)
	move_and_slide(velocity)

func _notification(what):
	if what == NOTIFICATION_PREDELETE:
		# destructor logic
		pass
