extends RigidBody2D

#TODO: Spawn enemies randomly 

export var min_speed = 200 
export var max_speed = 300 

#on frame 1, change the moster look randomly
func _ready():
	
	$AnimatedSprite.playing = true 
	#Recieve the list of mob actions
	var mob_types = $AnimatedSprite.frames.get_animation_names()
	#Randomly select a mob action (Also use randomize()
	randomize() #Has to be at the top to be effective
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]

	
	


func _on_VisibilityNotifier2D_screen_exited():
	queue_free() #Safer than free() 
