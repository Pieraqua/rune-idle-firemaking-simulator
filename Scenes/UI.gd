extends VSplitContainer

signal idle_clicked
signal wc_clicked
signal firemaking_clicked

enum {IDLE, WC, FM}

var current_status = IDLE


# speed counted in number per second
var fm_speed = 1
var wc_speed = 1

# progress kept in percentage (x/100)
var fm_progress = 0
var wc_progress = 0

var ashes = 0
var wood = 0

var fm_xp = 0
var wc_xp = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func switch_status(status):
	reset_progress()
	if(status == IDLE):
		print("idleing")
		current_status = IDLE
		pass
	elif(status == WC):
		print("wcing")
		current_status = WC
		pass
	elif(status == FM):
		print("firemaking")
		current_status = FM
		pass

func update_ui():
	get_node("ColorRect/HBoxContainer2/Inventory/Wood").text = "Wood: " + str(wood)
	get_node("ColorRect/HBoxContainer2/Inventory/Ashes").text = "Ashes: " + str(ashes)
	pass

# Called when a fire is sucessfully lit
func light_fire():
	ashes += 1
	wood -= 1
	fm_progress = 0
	update_ui()
	pass

# Called when a tree is sucessfully cut
func cut_tree():
	wood += 1
	wc_progress = 0
	update_ui()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Idle
	if(current_status == IDLE):
		
		pass
		
	# Firemaking
	elif(current_status == FM):
		fm_progress += fm_speed*delta
		if(wood == 0):
			print("Not enough wood to light fire")
			switch_status(IDLE)
		elif(fm_progress > 1):
			light_fire()
		pass
		
	# Woodcutting
	elif(current_status == WC):
		wc_progress += wc_speed*delta
		if(wc_progress > 1):
			cut_tree()
		pass
	pass
	
func reset_progress():
	wc_progress = 0
	fm_progress = 0
	pass

func _on_idle_clicked(event: InputEvent):
	if(event.is_pressed()):
		switch_status(IDLE)
		pass
	pass
	
func _on_wc_clicked(event: InputEvent):
	if(event.is_pressed()):
		switch_status(WC)
		pass
	pass
	
func _on_firemaking_clicked(event: InputEvent):
	if(event.is_pressed()):
		switch_status(FM)
		pass
	pass
