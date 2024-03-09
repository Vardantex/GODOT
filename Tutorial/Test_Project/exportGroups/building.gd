extends Node2D

#Testing the use of export groups
@export_group("Faction")
@export var team: String
@export var priority: int 

var array: Array 

# Called when the node enters the scene tree for the first time.
func _ready():
	#var local_out = array
	#
	#for i in range(10):
		##array[i] = "Hello!"
		#print(local_out) 
		
	for i in range(11):
		print(i)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
