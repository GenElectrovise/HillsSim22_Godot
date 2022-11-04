class_name Quest extends Node

export var QuestName = "?"
export var QuestDescription = "..."

export var stage: int = -1 setget set_stage
export var prepared: bool = false
export var started: bool = false
export var finished: bool = false
export var quest_id: int = -1
export var quest_type: int = -1

func _init():
	print(get_children())

# Objectives

func add_objective(objective):
	print("Adding Objective ", objective.get_id(), " to Quest ", get_id(), " at ", self)
	if(objective is Objective):
		add_child(objective)
		objective.obj_id = get_child_count() - 1
		print("Added Objective ", objective.get_id(), " to Quest ", get_id())
		print("children ", get_children())

func current() -> Objective:
	if stage > get_child_count() - 1:
		push_error(str("quest.stage out of bounds: ", stage, " vs max ", get_child_count() - 1))
	if stage < 0:
		push_error(str("quest.stage < 0 probably caused by incorrect stage tracking (not initialised?)"))
	var result = get_child(stage)
	return result

# Flow

func __prepare_q__(): 
	if prepared:
		push_error(str("Quest ", quest_id, " should not be prepared again!"))
		return
	prepared = true
	print("Preparing Quest ", get_id())

func __start_q__():
	if started:
		push_error(str("Quest ", quest_id, " should not be started again!"))
		return
	started = true
	print("Starting Quest ", get_id())

func __clean_q__():
	if finished:
		push_error(str("Quest ", quest_id, " should not be finished again!"))
		return
	finished = true
	print("Finishing Quest ", get_id())

func __check_objectives__():
	var current = current()
	if current.finished: # Finish off current objective
		current.clean_o()
	if stage + 1 < get_child_count(): # Start next objective
		stage += 1
		current().start_o()
	else: # Report quest as finished
		finished = true
		QuestManager.check_quests()
	pass

# Util

func get_id() -> String:
	return str(quest_type, ":", quest_id)

func set_stage(s: int):
	print("Changing Quest ", get_id(), " stage ", stage, " -> ", s)
	stage = s
