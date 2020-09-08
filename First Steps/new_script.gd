extends Node

func _ready():
	_doNotPass()
	pass
	
func _doNotPass():
	print("Did I pass?")
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("What key did I press?")
