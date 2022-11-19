class_name EffectManager extends Node

onready var player = get_parent()

var effects = {
	# "burning": []
}

func _physics_process(delta):
	if effects.has("burning"):
		player.hurt(DamageSource.new(DamageSource.DamageType.FIRE, 5))
		stop_effect("burning")

func add_effect(name:String, value:Array):
	effects[name] = value

func stop_effect(name:String):
	effects.erase(name)
