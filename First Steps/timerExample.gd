extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var count = 1
signal space_pressed(value)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout", self, "_on_Timer_timeout")
	self.connect("space_pressed", $Panel, "_hit_that_button")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		emit_signal("space_pressed", count)
		count += 1


func _on_Timer_timeout():
	$Sprite.visible = !$Sprite.visible
