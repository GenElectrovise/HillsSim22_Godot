extends HBoxContainer

func _process(delta):
	for k in range(PlayerData.inventory.items.size()):
		var item = PlayerData.inventory.items[k]
		if item != null:
			get_slot(k).set_texture(item.texture)
		else:
			get_slot(k).set_texture(null)
	pass

func get_slot(index: int):
	if index < get_child_count():
		var node = get_node(str("InventorySlot", index))
		return node 
	return null
