extends Node

static var _items = {}
static var _currentID : int = 0

static func addItem(itemName, itemTexture):
	if _items.has(itemName): 
		print("Item already exists: " + itemName)
		return
	var item = Item.new()
	item.ITEM_NAME = itemName
	item.ITEM_ID = _currentID
	item.ITEM_TEXTURE = itemTexture
	_items[itemName] = item
	_currentID += 1
	
static func getItem(itemName):
	return _items[itemName]

