extends Node

static func lookup(name) -> String:
	if(name.to_lower() == "outside"):
		return "res://levels/outside/outside_scene.tscn"
	elif(name.to_lower() == "inside"):
		return "res://levels/inside/inside_scene.tscn"
	return "null"
