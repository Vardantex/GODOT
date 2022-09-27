extends Control




func _on_RestartButton_pressed():
	#Get the level scene under tree 
	get_tree().change_scene("res://Levels/Level1.tscn")
