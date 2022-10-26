extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	call_deferred("wait_and_return")


func wait_and_return():
	print("Waiting...")
	var t = Timer.new()
	t.set_wait_time(1)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	print("Waiting for timeout")
	yield(t, "timeout")
	print("Let's go!")
	t.queue_free()
	Global.switch_scene(Levels.lookup("outside"))
