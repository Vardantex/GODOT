extends Node2D


func _ready():
	pass

#Make the Portal node inherit the body enter function
func _on_Area2D_body_entered(body):
	#Trigger the completion scene
	get_tree().call_group("GameState", "win_game")
