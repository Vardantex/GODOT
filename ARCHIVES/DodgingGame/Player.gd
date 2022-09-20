extends Area2D

#To make a parameter editable in the inspector, add export
export var speed = 400.0
	
#Collect the size of the game's border to restrict character
#from leaving

#Create a parameter to get Vector2 value for game
var screen_size = Vector2.ZERO

#This function runs at launch
func _ready():
	screen_size = get_viewport_rect().size
	print(screen_size)
	
	
#process function: how the character update every frame 
func _process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		direction.x += 1 
	if Input.is_action_pressed("move_left"):
		direction.x -= 1 
	if Input.is_action_pressed("move_up"):
		direction.y -= 1 
	if Input.is_action_pressed("move_down"):
		direction.y += 1 
	
	#ensure the player moves at a constant speed if move value 
	#greater than zero*
	#If pressing a button, can call animations 
	if direction.length() > 0: 
		direction = direction.normalized()
# get_node("AnimatedSprite") or $AnimatedSpride = Same thing
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += direction * speed * delta
	
#Create a condifiton to play animation based on where its
#moving
	
	if direction.x != 0:
		$AnimatedSprite.play("right")
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = direction.x < 0
	elif direction.y != 0:
		$AnimatedSprite.play("up")
		$AnimatedSprite.flip_v = direction.y >0 
	
	
	
#Limit the player's position to say in boundary
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
