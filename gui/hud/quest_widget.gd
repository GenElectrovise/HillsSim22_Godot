extends Control

class_name QuestsWidget

onready var StudyBox = $Foreground/QuestBoxes/StudyBox
onready var SocialBox = $Foreground/QuestBoxes/SocialBox
onready var PersonalBox = $Foreground/QuestBoxes/PersonalBox
onready var FutureBox = $Foreground/QuestBoxes/FutureBox

func _on_BigRedButton_pressed():
	GUI.HUD.close_menu()
	pass


func _on_QuestWidget_visibility_changed():
	if visible:
		refresh_text()
	pass

func refresh_text():
	var study_quest = QuestManager.get_quest(QuestManager.study_index, QuestManager.QuestTypes.STUDY)
	var social_quest = QuestManager.get_quest(QuestManager.social_index, QuestManager.QuestTypes.SOCIAL)
	var personal_quest = QuestManager.get_quest(QuestManager.personal_index, QuestManager.QuestTypes.PERSONAL)
	var future_quest = QuestManager.get_quest(QuestManager.future_index, QuestManager.QuestTypes.FUTURE)
	
	var study_name = study_quest.QuestName if study_quest != null else "-"
	var social_name = social_quest.QuestName if social_quest != null else "-"
	var personal_name = personal_quest.QuestName if personal_quest != null else "-"
	var future_name = future_quest.QuestName if future_quest != null else "-"
	
	var study_loc = str("Location: ", study_quest.QuestLocation) if study_quest != null else " "
	var social_loc = str("Location: ", social_quest.QuestLocation) if social_quest != null else " "
	var personal_loc = str("Location: ", personal_quest.QuestLocation) if personal_quest != null else " "
	var future_loc = str("Location: ", future_quest.QuestLocation) if future_quest != null else " "
	
	StudyBox.QuestName.text = study_name
	SocialBox.QuestName.text = social_name
	PersonalBox.QuestName.text = personal_name
	FutureBox.QuestName.text = future_name
	
	StudyBox.QuestLocation.text = study_loc
	SocialBox.QuestLocation.text = social_loc
	PersonalBox.QuestLocation.text = personal_loc
	FutureBox.QuestLocation.text = future_loc
