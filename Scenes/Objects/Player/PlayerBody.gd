extends CharacterBody2D

class_name PlayerCharacter

@export var Inventory : Control

@export var SPEED = 300.0
var target = Vector2()
var currentSpeed = 300.0
var currentAction = ACTION_IDLE

enum {
	ACTION_CHOP,
	ACTION_MOVE,
	ACTION_IDLE
}

func _unhandled_input(event: InputEvent):
	if(event.is_action_pressed("Move")):
		target = get_global_mouse_position()
		currentSpeed = SPEED
		currentAction = ACTION_MOVE
		print("Target: " + str(target))
	
func _ready():
	target = Vector2(0,0)

func _physics_process(delta):
	velocity = position.direction_to(target) * currentSpeed
	if position.distance_to(target) > 10:
		move_and_slide() 
	else:
		currentAction = ACTION_IDLE
		
var chopTime = 0
@export var chopRate = 1

func _process(delta):
	chopTime += delta
	if currentAction == ACTION_CHOP:
		if Inventory.getCurrentLen() >= 32:
			currentAction = ACTION_IDLE
		elif chopTime > chopRate:
			chopLog()
			chopTime = 0
	pass

func chopLog():
	Inventory.addItem(ItemDatabase.getItem("Log"))
