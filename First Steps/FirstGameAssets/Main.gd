extends Node2D

export (PackedScene) var Mob
var score
var vp_size

# Called when the node enters the scene tree for the first time.
func _ready():
	set_bounds()
	randomize()

func set_bounds():
	vp_size = get_viewport().size
	# will adjust the path node for mob spawing to the screen shape
	$MobPath.curve.set_point_position(0, Vector2(0,0))
	$MobPath.curve.set_point_position(1, Vector2(vp_size.x, 0))
	$MobPath.curve.set_point_position(2, vp_size)
	$MobPath.curve.set_point_position(3, Vector2(0, vp_size.y))
	# set background color rect to fit screen shape
	$ColorRect.margin_right = vp_size.x
	$ColorRect.margin_bottom = vp_size.y

func new_game():
	score = 0
	$Player.start(vp_size * 0.5)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Music.play()

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	get_tree().call_group("mobs", "queue_free")
	$Music.stop()
	$DeathSound.play()


func _on_MobTimer_timeout():
	# Choose a random location on Path2D.
	$MobPath/MobSpawnLocation.offset = randi()
	# Create a Mob instance and add it to the scene.
	var mob = Mob.instance()
	add_child(mob)
	# Set the mob's direction perpendicular to the path direction.
	var direction = $MobPath/MobSpawnLocation.rotation + PI / 2
	# Set the mob's position to a random location.
	mob.position = $MobPath/MobSpawnLocation.position
	# Add some randomness to the direction.
	direction += rand_range(-PI / 4, PI / 4)
	mob.rotation = direction
	# Set the velocity (speed & direction).
	mob.linear_velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = mob.linear_velocity.rotated(direction)
	if mob.linear_velocity.x < 0:
		mob.get_node("AnimatedSprite").flip_v = true

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_StartTimer_timeout():
	$ScoreTimer.start()
	$MobTimer.start()
