class_name Goth extends KinematicBody2D

var COSTUME: Costume

func _init():
	pass

func _ready():
	COSTUME = get_node("Costume")
	COSTUME.set_all("goth")
	pass

func _notification(what):
	if what == NOTIFICATION_PREDELETE:
		# destructor logic
		pass
