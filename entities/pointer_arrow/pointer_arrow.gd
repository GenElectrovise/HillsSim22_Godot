extends KinematicBody2D

var speed = 25
var lifetime = 0
const max_duration = 1

func _physics_process(delta):
	vanish()
	lifetime += delta

func vanish():
	if (lifetime > max_duration):
		queue_free()

func initialize(point):
	position = point
	
