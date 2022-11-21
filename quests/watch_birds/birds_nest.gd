class_name BirdsNest extends Sprite

signal on_birds_watched

onready var InteractionAnimator = $Interactable/InteractionAnimator

func _ready():
	visible = true
	InteractionAnimator.play_backwards("Glow")

func _on_Interactable_hover_changed(now_hovered):
	if now_hovered:
		InteractionAnimator.play("Glow")
	else:
		InteractionAnimator.play_backwards("Glow")

func _on_Interactable_on_interact():
	print("BirdNest has been interacted with!")
	InteractionAnimator.play("Bounce and vanish")
	yield(InteractionAnimator, "animation_finished")
	emit_signal("on_birds_watched")
