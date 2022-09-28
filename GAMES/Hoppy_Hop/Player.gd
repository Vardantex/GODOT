extends KinematicBody2D

#Create a boost constant 
const boost_multiplier = 2.5



#Create a game over const
const WORLD_LIMIT = 3000

#Movement across the screen
var motion = Vector2(0,0)

#Create a signal node for animation
signal animate

#Create a constant movement speed
const SPEED = 550
const GRAVITY = 250

#Define uP direction for vector to jump
const UP = Vector2(0,-1)

#Create a Jump Speed 
const JUMP_SPEED = 2500

#Runs every frame
# warning-ignore:unused_argument
func _physics_process(delta):
	
	apply_gravity()
	
	#Create the controls
	jump()
	movement()
	animate()
	
	#Enable movement for entity to game Vector
# warning-ignore:return_value_discarded
	move_and_slide(motion, UP)

#Create a function to apply gravity physics
func apply_gravity():
	if position.y > WORLD_LIMIT:
		get_tree().call_group("GameState", "end_game")
	if is_on_floor() and motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		#Move the character down
		motion.y = 1
	else:
		motion.y += GRAVITY

func jump():
	if Input.is_action_just_pressed("JUMP") and is_on_floor():
		motion.y -= JUMP_SPEED
#Play jumping sound effect 
		$AudioStreamPlayer.stream = load("res://SFX/jump1.ogg")
		$AudioStreamPlayer.play()
	
func movement():
	if Input.is_action_pressed("Left") and not Input.is_action_pressed("Right"): 
		motion.x = -SPEED
	elif Input.is_action_pressed("Right") && ! Input.is_action_pressed("Left"):
		motion.x = SPEED
	else:
		motion.x = 0
#

func animate():
	
	#Call the animation node with a signal 
	emit_signal("animate", motion)


#Create a damage effect 
func hurt():
	motion.y = -JUMP_SPEED
#	if lives <=0:
#		end_game()
	$AudioStreamPlayer.stream = load("res://SFX/pain.ogg")
	$AudioStreamPlayer.play()

func boost():
	motion.y = -JUMP_SPEED * boost_multiplier
	#For better quality, use the yield 
	position.y -= 1
	yield(get_tree(), "idle_frame") 
	
