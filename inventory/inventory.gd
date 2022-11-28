class_name Inventory extends Resource

export (Array) var items = [
	null, null, null,
	null, null, null,
	null, null, null
]

signal items_changed()

func add_item(item: Item) -> bool:
	for k in range(items.size()):
		if items[k] == null:
			items[k] = item
			emit_signal("items_changed")
			return true
	return false

func get_item(index: int) -> Item:
	if index in range(items.size()):
		return items[index]
	return null

func remove_item(index: int) -> Item:
	var old_item = null
	if range(items.size()).has(index):
		old_item = items[index]
		items[index] = null
		emit_signal("items_changed")
	return old_item
