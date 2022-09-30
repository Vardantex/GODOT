extends Control




func _on_PlayButton_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_LevelButton_pressed():
	pass # Replace with function body.

func _on_InstructionButton_pressed():

	get_tree().change_scene("res://Instructions.tscn")
