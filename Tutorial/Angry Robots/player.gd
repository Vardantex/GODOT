extends Area2D
signal hit


@export var speed: int = 400
@export var boost_factor: int = 4 
@export_color_no_alpha
var boost_color: Color = Color(1,.5, 1) 




#player boost duration(seconds)
@export_range(0, 1, 0.05, "suffix:s", "or_greater")
var boost_time: float = 0.2

#boost cooldown(seconds)
@export_range(0, 5, 0.1, "suffix:s", "or_greater")
var boost_cooldown_time: float = 2

#boost timer
var timer_boost := Timer.new() 
#Boost cd time 
var timer_cooldown := Timer.new() 

#player acceleration state
var is_boost: bool = false  

#player cd state
var is_cooldown: bool = false 

#size of game window
var screen_size: Vector2i


# Called when the node enters the scene tree for the first time.
func _ready():
	if Input.is_action_pressed("EXIT"):
		pass
	
	#pregvent player from leaving screen
	screen_size = get_viewport_rect().size
	
	#initialize boost timer 
	add_child(timer_boost)
	timer_boost.wait_time = boost_time
	timer_boost.one_shot = true 
	timer_boost.connect("timeout",
	boost_timer_timeout)
	
	#Initialize cd timer 
	add_child(timer_cooldown)
	timer_cooldown.wait_time = boost_cooldown_time 
	timer_cooldown.one_shot = true 
	timer_cooldown.connect("timeout",
	cooldown_timer_timeout)
	
	
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#Player velocity
	var velocity: Vector2 = Vector2.ZERO
	
	#player movement
	if Input.is_action_pressed("INPUT_RIGHT"):
		velocity.x +=1 
		#print("RIGHT")
	if Input.is_action_pressed("INPUT_LEFT"):
		velocity.x -= 1
		#print("LEFT")
	if Input.is_action_pressed("INPUT_DOWN"):
		velocity.y += 1
		#print("DOWN")
	if Input.is_action_pressed("INPUT_UP"):
		velocity.y -= 1
		#print("UP")
	
	#if Input.is_action_pressed("SPACE_BUTTON")
	if Input.is_action_pressed("SPACE_BUTTON"):
		if not is_boost and not is_cooldown:
			print("Boosting")
			timer_boost.start()
			timer_cooldown.start()
			is_boost = true 
			is_cooldown = true 
			$Sprite2D.modulate = boost_color
	
	
	#prevent diagonal input inceasing speed
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed 
	
	#update player position
	position += velocity * delta 
	
	if is_boost:
		velocity *= (boost_factor+speed)
	
	#Periodic Boundaries 
	if position.x < 0:
		position.x = screen_size.x 
	if position.x > screen_size.x:
		position.x = 0 
	if position.y < 0:
		position.y = screen_size.y 
	if position.y > screen_size.y:
		position.y = 0 
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed 
	
	
	
	
	#pass

#called when the boost timer triggered 
func boost_timer_timeout():
	is_boost = false 
	print("Boost Time Out")

#Called when boost cd timer triggered 
func cooldown_timer_timeout(): 
	is_cooldown = false 
	print("CD time out")
	$Sprite2D.modulate = Color(1,1,1) 
	print("Cd time out")
	




