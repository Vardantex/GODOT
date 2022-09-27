extends KinematicBody2D

#Movement across the screen
var motion = Vector2(0,0)

#Create a signal node for animation
signal animate

#Create a constant movement speed
const SPEED = 550
const GRAVITY = 250

#Define uP direction for vector
const UP = Vector2(0,-1)

#Create a Jump Speed 
const JUMP_SPEED = 2500

#Runs every frame
func _physics_process(delta):
	
	apply_gravity()
	
	#Create the controls
	jump()
	movement()
	animate()
	
	#Enable movement for entity to game Vector
	move_and_slide(motion, UP)

#Create a function to apply gravity physics
func apply_gravity():
	if ! is_on_floor():
		motion.y += GRAVITY
	else:
		motion.y = 0

func jump():
	if Input.is_action_just_pressed("JUMP") and is_on_floor():
		motion.y -= JUMP_SPEED

	
func movement():
	if Input.is_action_pressed("Left") and not Input.is_action_pressed("Right"): 
		motion.x = -SPEED
	elif Input.is_action_pressed("Right") && ! Input.is_action_pressed("Left"):
		motion.x = SPEED
	else:
		motion.x = 0

func animate():
	
	#Call the animation node with a signal 
	emit_signal("animate", motion)

#	if motion.y < 0:
#		$PlayerAnimation.play("jump")
#	elif motion.x > 0:
#		$PlayerAnimation.play("walk")
#		$PlayerAnimation.flip_h = false
#	elif motion.x < 0:
#		$PlayerAnimation.play("walk")
#		$PlayerAnimation.flip_h = true
#	else:
#		$PlayerAnimation.play("idle")


