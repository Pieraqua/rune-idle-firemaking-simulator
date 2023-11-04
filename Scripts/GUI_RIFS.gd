extends Control

@export var Inventory : GridContainer

func getCurrentLen():
	return Inventory.getCurrentLen()
	
func removeItem(pos : int):
	Inventory.removeItem(pos)

func hasItem(item : Item):
	return Inventory.hasItem(item)

func getItem(pos : int):
	return Inventory.getItem(pos)
	
func addItem(item : Item):
	Inventory.addItem(item)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
