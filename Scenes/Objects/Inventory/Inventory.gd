extends GridContainer

var _inventoryItems = []

func getCurrentLen():
	return len(_inventoryItems)
	
func removeItem(pos : int):
	_inventoryItems.remove_at(pos)

func hasItem(item : Item):
	return _inventoryItems.has(item)

func getItem(pos : int):
	return _inventoryItems[pos]
	
func addItem(item : Item):
	if(len(_inventoryItems) >= 32):
		return -1
	_inventoryItems.append(item)
	updateInventory()

func updateInventory():
	assert(len(_inventoryItems) <= 32)
	for n in get_children():
		remove_child(n)
		n.queue_free()
	
	for item in _inventoryItems:
		var newItem : Item = item 
		var newIcon = TextureRect.new()
		newIcon.texture = load(item.ITEM_TEXTURE)
		add_child(newIcon)
