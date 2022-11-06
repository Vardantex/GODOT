extends Control


func _ready():
	pass


func _on_RestartButton_pressed():
	get_tree().change_scene("res://Level_Select.tscn")


func _on_MainMenuButton_pressed():
	get_tree().change_scene("res://Main_Menu.tscn")
