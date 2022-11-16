extends Node2D

class_name Costume

onready var HEAD: CostumePart = $Head
onready var EYE: CostumePart = $Eye
onready var HAIR: CostumePart = $Hair
onready var SHIRT: CostumePart = $Shirt
onready var HANDS: CostumePart = $Hands
onready var LEGS: CostumePart = $Legs
onready var FEET: CostumePart = $Feet

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
	HANDS.modulate = scaleColour(241, 186, 144) # Pale
	SHIRT.modulate = scaleColour(217, 14, 15) # Red
	LEGS.modulate = scaleColour(217, 14, 15) # Red
	FEET.modulate = scaleColour(217, 14, 15) # Red

func set_part(style: String, part: String):
	var texture = get_part(style, part)
	match part:
		"head":
			HEAD.texture = texture
		"eye":
			EYE.texture = texture
		"hair":
			HAIR.texture = texture
		"shirt":
			SHIRT.texture = texture
		"hands":
			HANDS.texture = texture
		"legs":
			LEGS.texture = texture
		"feet":
			FEET.texture = texture

func set_all(style: String):
	set_part(style, "eye")
	set_part(style, "feet")
	set_part(style, "hair")
	set_part(style, "hands")
	set_part(style, "head")
	set_part(style, "legs")
	set_part(style, "shirt")

static func get_part(style: String, part: String):
	var path = str("res://assets/costumes/", style, "/", part, ".png")
	var texture = load(path)
	return texture
