extends Quest

func _init(quest_type_in):
	QuestName = "QuestName"
	QuestDescription = "QuestDescription"
	type = quest_type_in

func s__on_objective_finished():
	# Custom behavior
	.s__on_objective_finished()
	# More custom behavior
	pass

func i__start_quest():
	add_objectives()
	.i__start_quest()
	# Custom behavior
	if get_tree().get_nodes_in_group(objective_group_name).size() > 0:
		get_tree().get_nodes_in_group(objective_group_name)[0].i__start_objective()
	else:
		push_error(str("Quest ", self, " attempted to i__start_quest() with no Objectives. Finishing it with i__finish_quest()"))
		i__finish_quest()
	pass

func i__clean_quest():
	# Custom cleaning
	.i__clean_quest()

func add_objectives():
	# add_objective()
	pass

func _to_string() -> String:
	return str("QuestType")
