extends Area2D



func _on_SpikeTop_body_entered(body):
	#Get the group name and call the method
	get_tree().call_group("GameState", "hurt")
	
