class_name FeedCrackheadsObjective extends Objective

## Virtual methods

func _init().():
	ObjectiveDescription = "Feed the crackheads"
	ObjectiveLocation = "Leisure"
	pass

func _physics_process(_delta):
	if Input.is_action_just_pressed("debug"):
		i__finish_objective()

func i__start_objective():
	# Custom starting
	.i__start_objective()
	pass

func i__finish_objective():
	# Custom finishing
	.i__finish_objective()
	pass

func i__clean_objective():
	# Custom cleaning
	.i__clean_objective()
	pass

func _to_string():
	return str("FeedCrackheadsObj{}")
