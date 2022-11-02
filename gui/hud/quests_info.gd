extends VBoxContainer

class_name QuestsInfo

export var RoundelTexture_Texture: Texture
export var QuestTitle_Text: String 
export var QuestDescription_Text: String
export var ObjectiveImage_Texture: Texture
export var ObjectiveLocation_Text: String
export var ObjectivePart_Text: String 
export var ObjectiveDescription_Text: String

onready var Roundel: TextureRect = $TitleBox/Roundel
onready var QuestTitle: Label = $TitleBox/Title
onready var QuestDescription: Label = $Description
onready var ObjectiveImage: TextureRect = $ObjectiveInfo/Image
onready var ObjectiveLocation: Label = $ObjectiveInfo/ObjectiveInfo/Location
onready var ObjectivePart: Label = $ObjectiveInfo/ObjectiveInfo/Part
onready var ObjectiveDescription: Label = $ObjectiveInfo/ObjectiveInfo/Description

func _ready():
	Roundel.texture = RoundelTexture_Texture
	QuestTitle.text = QuestTitle_Text
	QuestDescription.text = QuestDescription_Text
	ObjectiveImage.texture = ObjectiveImage_Texture
	ObjectiveLocation.text = ObjectiveLocation_Text
	ObjectivePart.text = ObjectivePart_Text
	ObjectiveDescription.text = ObjectiveDescription_Text
