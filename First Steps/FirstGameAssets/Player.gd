extends Area2D

signal hit

export var speed = 400
var screen_size
var target = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()
	

func start(pos):
	position = pos
	target = pos
	show()
	$CollisionShape2D.disabled = false

#func _input(event):
#	if event is InputEventMouseButton:
#		target = event.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# define velocity and get vector from input actions
	# actions can be defined in Project Settings
	var velocity = Vector2()
	if Input.is_action_pressed("mouse_left_click"):
		target = get_viewport().get_mouse_position()
		
	# Touch and mouse based input system
	if position.distance_to(target) > 10:
		velocity = target - position
	
	# check velocity is > 0 and move player
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	# change anim and flip dependent on vector
	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0
	# move and clamp the player to screen space
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)


func _on_Player_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
	

	
	
	
	
	
