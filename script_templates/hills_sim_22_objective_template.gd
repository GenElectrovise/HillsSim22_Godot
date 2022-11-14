extends Objective

func _init().():
	ObjectiveDescription = "ObjectiveDescription"
	ObjectiveLocation = "ObjectiveLocation"
	# Custom construction
	pass 

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

func _to_string() -> String:
	return str("ObjectiveType")
