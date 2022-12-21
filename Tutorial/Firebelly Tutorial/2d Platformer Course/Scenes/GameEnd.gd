extends Control


func _ready() -> void:
	
	pass


func _on_Timer_timeout() -> void:
	
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	pass # Replace with function body.
