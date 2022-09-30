extends Control


func _ready():
	pass





func _on_Level_One_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")


func _on_Level_Two_pressed():
	get_tree().change_scene("res://Levels/Level2.tscn")

func _on_Level_Three_pressed():
	get_tree().change_scene("res://Levels/Level3.tscn")



func _on_Return_Button_pressed():
	get_tree().change_scene("res://Main_Menu.tscn")


