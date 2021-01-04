extends ARVRController



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rumble > 0.0:
		rumble -= 0.05;

func button_pressed(button_index):
	if button_index == JOY_VR_TRIGGER:
		on_button_pressed_trigger()

func on_button_pressed_trigger():
	rumble = 1.0
