class_name Affectable extends Node

onready var OWNER = get_parent()

signal effect_applied(effect)
signal effect_removed(effect)

export (Array) var effects

func apply_effect(effect):
	emit_signal("effect_applied")
	effects.append(effect)

func remove_effect(effect):
	emit_signal("effect_removed")
	effects.remove(effect)
