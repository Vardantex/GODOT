extends Sprite

var angular_speed = PI
var speed = 122

#delta is the time interval between 2 frames 
#Position: times by delta makes it time dependant than frame


func _process(delta):
# Create a condition to check user's directional inputs
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction = -1
	if Input.is_action_pressed("ui_right"):
		direction = 1
	#Stop movement
	if Input.is_action_pressed("ui_down"):
		speed -= 0
#	if Input.is_action_pressed("ui_up"):
#		speed += .5
	
	rotation += delta * angular_speed * direction
	
	#Start movement
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed * delta 
	position += velocity
	

