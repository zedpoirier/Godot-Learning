extends Control

var target = 10
var d1 = 3 
var d2 = 5
var dividors = [3 , 5] # not implemented

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Problem 1:")
	print("dividers = 3, 5")
	print("target = " + str(target))
	
	target -= 1
	var i = 0
	while target > 0:
		if target % 3 == 0:
			i += target
		elif target % 5 == 0:
			i += target
		target -= 1
	
	print("sum = " + str(i))
