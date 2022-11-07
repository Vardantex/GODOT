extends KinematicBody2D

enum State {NORMAL, DASHING}

var gravity = 900 
var velocity = Vector2.ZERO
var maxHSpeed = 200
var Hacceleration = 400
var jumpSpeed = 300
var jumpTermMultiplier = 3
var currentState = State.NORMAL
var maxDashSpeed = 500
var minDashSpeed = 200
var isStateNew = true
var hasDash = false

func _ready() -> void:
	pass
	


func change_state(newState):
	currentState = newState
	#Reset isStateNew
	isStateNew = true

func _process(delta: float) -> void:
	
	match currentState:
		State.NORMAL:
			_process_normal(delta)
		State.DASHING:
			_process_dash(delta)
	isStateNew = false
	
	closeGame()
	resetMethod()
	updateAnimation()
	
	

#This custom process function will handle all the movement for customization
func _process_normal(delta):
	#Check if state changed to normal
	if (isStateNew):
		$DashArea/CollisionShape2D.disabled = true
	var moveVector = get_movement_vector()
	var wasOnFloor = is_on_floor()
	
	##### Two Movement methods #####
	#Move char left right based on max speed
#	velocity.x = moveVector.x * maxHSpeed
	
	#aply acceleration
	velocity.x += moveVector.x * Hacceleration * delta
	
	
	#Check if the player's vector is on 0 to decelerate it
	if (moveVector.x == 0):
		#low power makes it slide
		velocity.x = lerp(0, velocity.x, pow(2, -25 * delta))
		
		
	
	#Check that the acceleration doesnt exceed
	clamp(velocity.x, -Hacceleration, Hacceleration)
	
	
	
#Make character jump properly
	if (Input.is_action_just_pressed("WASD_UP")):
		moveVector.y = -1
	else:
		moveVector.y = 0
	
	if (moveVector.y < 0 && (is_on_floor() || !$CoyoteTimer.is_stopped())):
		velocity.y = moveVector.y * jumpSpeed
	
	if (velocity.y < 0 and not Input.is_action_pressed("WASD_UP")):
		#Apply enhanved gravity if player hold jump
		velocity.y += gravity * jumpTermMultiplier *delta
	else:
		#Apply normal gravity on character
		velocity.y += gravity * delta
	
	#move and slide ( x, y)
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if (wasOnFloor && !is_on_floor()):
		$CoyoteTimer.start()
	
	#Check to dash only on floor
	if (is_on_floor()):
		hasDash = true
	
	if (hasDash && Input.is_action_just_pressed("DASH")):
		call_deferred("change_state", State.DASHING)
		hasDash = false 

#This custom process function will handle all the movement for dashing
func _process_dash(delta):
	#Apply the dash modifier when state is new
	if (isStateNew): #Checks if state is changed to dashing
		$DashArea/CollisionShape2D.disabled = false
		$AnimatedSprite.play("jump")
		var moveVector = get_movement_vector()
		var velocityMod = 1 
		if (velocity.x != 0):
			velocityMod = sign(moveVector.x)
		else:
			#whichever the char is facing
			velocityMod = 1 if $AnimatedSprite.flip_h else -1
		
		velocity = Vector2(maxDashSpeed * velocityMod, 0)
	
	velocity = move_and_slide(velocity, Vector2.UP)
	#Decay the move speed boost
	velocity.x = lerp(0 , velocity.x, pow(2, -20 * delta))
	
	#Return to normal when decay gets too low: abs fix direction limit
	if (abs(velocity.x) < minDashSpeed):
		call_deferred("change_state", State.NORMAL)
	


#This method's made to determine whether the player is jumping
func get_movement_vector():
	
	var moveVector = Vector2.ZERO
	#Cancel out double input 
	moveVector.x = Input.get_action_strength("WASD_RIGHT") - Input.get_action_strength("WASD_LEFT")
	
	if (Input.is_action_just_pressed("WASD_UP")):
		moveVector.y = -1
	else:
		moveVector.y = 0
	return moveVector

#Test new controls later
func buttonMovement():
	pass

func closeGame():
	if(Input.is_action_pressed("CLose_Game")):
		get_tree().quit()

func resetMethod():
	if(Input.is_action_just_pressed("Reset")):
		get_tree().reload_current_scene()


func updateAnimation():
	var moveVec = get_movement_vector()
	
	if (!is_on_floor()):
		$AnimatedSprite.play("jump")
	elif(moveVec.x < 0):
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("run")
	elif(moveVec.x > 0):
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("run")
	else:
		$AnimatedSprite.play("idle")
	




