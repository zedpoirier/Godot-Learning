extends Control

var target = 1000
var d1 = 3 
var d2 = 5
var dividors = [3 , 5]

# Called when the node enters the scene tree for the first time.
func _ready():
	target -= 1
	var i = 0
	while target > 0:
		if target % 3 == 0:
			i += target
		elif target % 5 == 0:
			i += target
		target -= 1
	
	print("dividers = 3, 5")
	print("target = 100")
	print("sum = " + String(i))
	
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
