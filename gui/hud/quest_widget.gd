extends Control

onready var StudyInfo: QuestsInfo = $Foreground/Study

func _on_visibility_changed():
	if visible:
		refresh_text()
	pass

func refresh_text():
	var study_quest: Quest = QuestManager.get_quest(QuestManager.study_index, QuestManager.QuestTypes.STUDY)
	var study_objec: Objective = study_quest.current() if study_quest != null else null
	refresh_info(study_quest, study_objec, StudyInfo)
	
	return

func refresh_info(quest: Quest, objec: Objective, info: QuestsInfo):
	var q_name: String = quest.QuestName if quest != null else "-"
	var q_desc: String = quest.QuestDescription if quest != null else "-"
	var o_lctn: String = objec.ObjectiveLocation if objec != null else "-"
	var o_desc: String = objec.ObjectiveDescription if objec != null else "-"
	var o_part: String = str(quest.stage + 1, "/", quest.objectives.size()) if quest != null else "-"
	var o_img: Texture = objec.ObjectiveImage if objec != null else null
	
	info.QuestTitle.text = q_name
	info.QuestDescription.text = q_desc
	info.ObjectiveLocation.text = str("Location: ", o_lctn)
	info.ObjectiveDescription.text = o_desc
	info.ObjectivePart.text = str("Part: ", o_part)
	info.ObjectiveImage.texture = o_img

func _on_BigRedButton_pressed():
	GUI.HUD.close_menu()
	pass
