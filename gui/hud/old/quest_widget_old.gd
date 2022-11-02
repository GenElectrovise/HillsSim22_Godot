extends Control

class_name QuestsWidget_old

onready var StudyInfo: QuestsInfo = $Foreground/Study

func _on_BigRedButton_pressed():
	GUI.HUD.close_menu()
	pass


func _on_QuestWidget_visibility_changed():
	if visible:
		refresh_text()
	pass

func refresh_text():
	print_debug("Why is refresh_text being called?")
	return
	var study_quest = QuestManager.get_quest(QuestManager.study_index, QuestManager.QuestTypes.STUDY)
	
	var study_name = study_quest.current().ObjectiveName if study_quest != null else "-"
	
	var study_loc = str("Location: ", study_quest.current().ObjectiveLocation) if study_quest != null else " "
	
	StudyInfo.QuestTitle.text = "Quest title :)"
	StudyInfo.QuestDescription.text = "Description :)"
	StudyInfo.ObjectiveDescription.text = "Description! :)"
	StudyInfo.ObjectiveLocation.text = "Somewhere..."
	StudyInfo.ObjectivePart.text = "100/23"
