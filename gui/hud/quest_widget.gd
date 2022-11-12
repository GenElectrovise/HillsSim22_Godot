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
	var study_quests = get_tree().get_nodes_in_group(QuestManager.STUDY_GRP)
	var study_quest = study_quests[0] if study_quests.size() > 0 else null
	var study_objec: Objective = study_quest.current() if study_quest != null else null
	refresh_info(study_quest, study_objec, StudyInfo)
	
	var social_quests = get_tree().get_nodes_in_group(QuestManager.SOCIAL_GRP)
	var social_quest = social_quests[0] if social_quests.size() > 0 else null
	var social_objec: Objective = social_quest.current() if social_quest != null else null
	refresh_info(social_quest, social_objec, SocialInfo)
	
	var personal_quests = get_tree().get_nodes_in_group(QuestManager.PERSONAL_GRP)
	var personal_quest = personal_quests[0] if personal_quests.size() > 0 else null
	var personal_objec: Objective = personal_quest.current() if personal_quest != null else null
	refresh_info(personal_quest, personal_objec, PersonalInfo)
	
	var future_quests = get_tree().get_nodes_in_group(QuestManager.FUTURE_GRP)
	var future_quest = future_quests[0] if future_quests.size() > 0 else null
	var future_objec: Objective = future_quest.current() if future_quest != null else null
	refresh_info(future_quest, future_objec, FutureInfo)
	
	return

func refresh_info(quest: Quest, objec: Objective, info: QuestsInfo):
	var q_name: String = quest.QuestName if quest != null else "-"
	var q_desc: String = quest.QuestDescription if quest != null else "-"
	var o_lctn: String = objec.ObjectiveLocation if objec != null else "-"
	var o_desc: String = objec.ObjectiveDescription if objec != null else "-"
	var o_part: String = str(quest.stage + 1, "/", quest.get_child_count()) if quest != null else "-"
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
