extends Control

onready var CharismaBar = $CharismaBar
onready var ConcentrationBar = $ConcentrationBar
onready var HappinessBar = $HappinessBar
onready var IntelligenceBar = $IntelligenceBar

func _process(_delta):
	CharismaBar.value = PlayerData.charisma
	ConcentrationBar.value = PlayerData.concentration
	HappinessBar.value = PlayerData.happiness
	IntelligenceBar.value = PlayerData.intelligence
