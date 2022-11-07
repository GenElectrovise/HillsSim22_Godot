class_name WatchBirdsObjective extends Objective

var BirdsNestObjectiveScene = load("res://quests/watch_birds/WatchBirdsObjective.tscn")
var nest

onready var area = $Area2D
onready var shape = $Area2D/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _init():
	ObjectiveDescription = "Watch birds"
	ObjectiveLocation = "The Quad"
	print(self, " is created as ", get_id())
	pass 

# Inherited #

func prepare_o(position: Vector2):
	.__prepare_o__()
	self.position = position
	print(self, " is prepared as ", get_id())

func start_o():
	.__start_o__()
	nest = BirdsNestObjectiveScene.instance()
	nest.position = self.position
	Global.CurrentScene.add_child(nest)
	print(self, " has started as ", get_id())
	# finish()
	print("!")
	print("real node ", self)
	print("real children ", get_children())
	print("real parent ", get_parent())
	

func clean_o():
	.__clean_o__()
	nest.queue_free()

func _physics_process(delta):
	if Input.is_action_just_pressed("debug"):
		finish()

func finish():
	print(self, " has finished as ", get_id())
	print("FINISHING OBJECTIVE ", get_id())
	print($Sprite)
	print($Area2D)
	print($Area2D/CollisionShape2D)
	QuestManager.dump()
	self.finished = true
	print(self)
	QuestManager.dump()
	print("//FINISHING OBJECTIVE")
	QuestManager.notify_quests_objective_completed()
	pass
		

# Custom #


func _on_Area2D_area_entered(area):
	print("=")
	QuestManager.dump()
	print("self ", self)
	print("get_children ", get_children())
	print("get_parent ", get_parent())
	pass # Replace with function body.
