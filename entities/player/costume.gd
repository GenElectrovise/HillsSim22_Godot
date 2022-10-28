extends Node2D

class_name Costume

onready var HEAD = $Head
onready var EYE = $Eye
onready var HAIR = $Hair
onready var SHIRT = $Shirt
onready var HANDS = $Hands
onready var LEGS = $Legs
onready var FEET = $Feet

func _ready():
	pass # Replace with function body.

func scale(i) -> float:
	var x: float = (i as float) / 255
	return x

func scaleColour(r, g, b) -> Color:
	var c = Color(scale(r), scale(g), scale(b))
	return c

func reset():
	HEAD.modulate = scaleColour(241, 186, 144) # Pale
	# EYE.modulate = scaleColour(121, 64, 13) # Brown
	HAIR.modulate = scaleColour(189, 107, 29) # Brown
	SHIRT.modulate = scaleColour(217, 14, 15) # Red
	LEGS.modulate = scaleColour(217, 14, 15) # Red
	FEET.modulate = scaleColour(217, 14, 15) # Red
