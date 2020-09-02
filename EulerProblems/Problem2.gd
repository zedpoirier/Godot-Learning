extends Control

var maxVal = 4000000
var prev = 1
var curr = 1
var temp = 0
var sum = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Problem 2:")
	while curr < maxVal:
		if curr % 2 == 0:
			sum += curr
		temp = curr
		curr += prev
		prev = temp
	print("Sum = " + str(sum))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
