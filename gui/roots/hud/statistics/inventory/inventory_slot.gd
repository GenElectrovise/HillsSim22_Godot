class_name InventorySlot extends ColorRect

onready var TextureRect = $Texture

func set_texture(texture: Texture):
	TextureRect.texture = texture
