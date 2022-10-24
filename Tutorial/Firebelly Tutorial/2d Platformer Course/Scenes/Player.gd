extends KinematicBody2D

var gravity = 900 
var velocity = Vector2.ZERO
var maxHSpeed = 200
var Hacceleration = 400
var jumpSpeed = 300
var jumpTermMultiplier = 3

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	resetMethod()
	
	var moveVector = Vector2.ZERO
	
	#<pve char
	moveHorizontal(moveVector, delta)
	
	#Move char upwards
	moveVertical(moveVector, delta)


func moveVertical(moveVector, delta):
#Make character jump properly
	if (Input.is_action_just_pressed("WASD_UP")):
		moveVector.y = -1
	else:
		moveVector.y = 0
	
	if (moveVector.y < 0 && is_on_floor()):
		velocity.y = moveVector.y * jumpSpeed
	
	if (velocity.y < 0 and not Input.is_action_pressed("WASD_UP")):
		#Apply enhanved gravity if player hold jump
		velocity.y += gravity * jumpTermMultiplier *delta
	else:
		#Apply normal gravity on character
		velocity.y += gravity * delta
	
	#move and slide ( x, y)
	velocity = move_and_slide(velocity, Vector2.UP)
	

func moveHorizontal(moveVector, delta):
	moveVector.x = Input.get_action_strength("WASD_RIGHT") - Input.get_action_strength("WASD_LEFT")
	
	##### Two Movement methods #####
	#Move char left right based on max speed
#	velocity.x = moveVector.x * maxHSpeed
	
	#aply acceleration
	velocity.x += moveVector.x * Hacceleration * delta
	
	##### Two Movement methods #####
	
	
	
	
	#Check if the player's vector is on 0 to decelerate it
	if (moveVector.x == 0):
		#low power makes it slide
		velocity.x = lerp(0, velocity.x, pow(2, -25 * delta))
		
		
	
	#Check that the acceleration doesnt exceed
	clamp(velocity.x, -Hacceleration, Hacceleration)
	



func resetMethod():
	if(Input.is_action_just_pressed("Reset")):
		get_tree().reload_current_scene()


