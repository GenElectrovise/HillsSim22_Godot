extends Control

onready var StudyInfo: QuestsInfo = $Foreground/Study
onready var SocialInfo: QuestsInfo = $Foreground/Social
onready var PersonalInfo: QuestsInfo = $Foreground/Personal
onready var FutureInfo: QuestsInfo = $Foreground/Future

func _on_visibility_changed():
	if visible:
		refresh_text()
	pass

func refresh_text():
	var study_quest: Quest = QuestManager.get_quest(QuestManager.study_index, QuestManager.QuestTypes.STUDY)
	var study_objec: Objective = study_quest.current() if study_quest != null else null
	refresh_info(study_quest, study_objec, StudyInfo)
	
	var social_quest: Quest = QuestManager.get_quest(QuestManager.social_index, QuestManager.QuestTypes.SOCIAL)
	var social_objec: Objective = social_quest.current() if social_quest != null else null
	refresh_info(social_quest, social_objec, SocialInfo)
	
	var personal_quest: Quest = QuestManager.get_quest(QuestManager.personal_index, QuestManager.QuestTypes.PERSONAL)
	var personal_objec: Objective = personal_quest.current() if personal_quest != null else null
	refresh_info(personal_quest, personal_objec, PersonalInfo)
	
	var future_quest: Quest = QuestManager.get_quest(QuestManager.future_index, QuestManager.QuestTypes.FUTURE)
	var future_objec: Objective = future_quest.current() if future_quest != null else null
	refresh_info(future_quest, future_objec, FutureInfo)
	
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
