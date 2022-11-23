class_name WorldModulate extends CanvasModulate

onready var Animator = $AnimationPlayer

func _ready():
	Animator.get_animation("Daylight Cycle").loop = true
	Animator.play("Daylight Cycle")

func _process(_delta):	
	var seek_to: float = (
		Clock.hours 
		+ lerp(0.0, 1.0, Clock.minutes / 60.0) 
		+ lerp(0.0, 1/60, Clock.seconds / 60.0)
		)
	Animator.seek(seek_to)
