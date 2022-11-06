extends Node2D

var timeout = false

func _process(delta):
	#Set the ray cast to only trigger when it touch player
	if $Sprite/RayCast2D.is_colliding():
		fire()
		
		
		

func fire():
	#Add a new node as a child (lightning) as an instance
	#Use the raycast node to support the direction of attack
	$Sprite/RayCast2D.add_child(load("res://Hazards/Lightning.tscn").instance())
	$Sprite/Timer.start()
	timeout = true



func _on_Timer_timeout():
	timeout = false
