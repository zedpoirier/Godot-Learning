extends Panel

var totalTime = 0;
var delay = 1;
var stopped = false

func _ready():
	get_node("Button").connect("pressed", self, "_hit_that_button")
	
func _hit_that_button(value):
	get_node("Label").text = "HELLO!"
	$Count.text = str(value)
	stopped = true
	
func _process(delta):
	totalTime += delta
	if !stopped:
		get_node("Label").text = str(totalTime)
	else:
		delay -= delta
		if delay <= 0:
			delay = 1
			stopped = false

# https://docs.godotengine.org/en/stable/getting_started/step_by_step/signals.html
