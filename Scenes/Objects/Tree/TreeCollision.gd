extends Area2D

func _on_body_entered(body):
	if body is PlayerCharacter:
		body.currentSpeed = 0
		body.currentAction = body.ACTION_CHOP
