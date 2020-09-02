#https://raytracing.github.io/books/RayTracingInOneWeekend.html
extends Control

var width = 256
var height = 256

# Called when the node enters the scene tree for the first time.
func _ready():
	# generate image data
	var image = "P3\n" + str(width) + " " + str(height) + "\n255\n"
	for y in range(height):
		for x in range(width):
			image += str(x) + " " + str(256 - y) + " 0\n" #63 for blue
	
	# prepare image file
	var file = File.new()
	var path = "C:/Dev/Godot-Learning/RayTracing/image.ppn"
	file.open(path, 7)
	file.store_string(image)
	print(image)
	file.close()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
