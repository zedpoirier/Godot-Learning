extends Sprite



# Called when the node enters the scene tree for the first time.
func _ready():
	var t = Transform2D()
	# Translation
	t.origin.x = 350
	t.origin.y = 150
	# Rotation
	var rot = -0.5
	t.x.x = cos(rot)
	t.y.y = cos(rot)
	t.x.y = sin(rot)
	t.y.x = -sin(rot)
	# Scale
	t.x *= 3
	t.y *= 3
	# Apply
	transform = t # Change the node's transform to what we just calculated.

