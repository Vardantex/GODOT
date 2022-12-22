extends Control


func _ready() -> void:
	pass





func _on_SingleButton_pressed() -> void:
	get_tree().change_scene("res://Levels/Level1.tscn")
	
	pass # Replace with function body.


func _on_MultiButton_pressed() -> void:
	get_tree().change_scene("res://Levels/ArenaLevel.tscn")
	pass # Replace with function body.


func _on_QuitButton_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_InstructButton_pressed() -> void:
	get_tree().change_scene("res://Scenes/Instructions.tscn")
	pass # Replace with function body.


func _on_SourcesButton_pressed() -> void:
	get_tree().change_scene("res://Scenes/Credits.tscn")
	
	pass # Replace with function body.


func _on_VoteButton_pressed() -> void:
	OS.shell_open("https://strawpoll.com/polls/1MnwvepXjy7")
	pass # Replace with function body.
