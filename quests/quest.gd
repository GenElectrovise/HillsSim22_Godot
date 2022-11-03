extends Node

class_name Quest

export var QuestName = "?"
export var QuestDescription = "..."

const QUEST_GROUP = "quests"

var stage: int = -1 setget set_stage
var prepared: bool = false
var started: bool = false
var finished: bool = false
var objectives = []
var quest_id
var quest_type

# Objectives

func add_objective(objective):
	if(objective is Objective):
		objectives.append(objective)
		objective.quest = self
		objective.obj_id = objectives.size() - 1
		print("Added Objective ", objective.get_id(), " to Quest ", get_id())

func current() -> Objective:
	if stage > objectives.size() - 1:
		push_error(str("quest.stage out of bounds: ", stage, " vs max ", objectives.size() - 1))
	if stage < 0:
		push_error(str("quest.stage < 0 probably caused by incorrect stage tracking (not initialised?)"))
	return objectives[stage]

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

func __finish_q__():
	if finished:
		push_error(str("Quest ", quest_id, " should not be finished again!"))
		return
	finished = true
	print("Finishing Quest ", get_id())

func __check_objectives__():
	var current = current()
	if current.finished: # Finish off current quest
		current.finish_o()
	if stage + 1 < objectives.size(): # Start next objective
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
