extends Node2D

#Testing the use of export groups
@export_group("Faction")
@export var floors: int  


@export var priority: int 
@export_subgroup("Sackett")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
