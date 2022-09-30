extends Control

var level 

func _ready():
#	add_to_group("GameOver")
#	getScene(25)
	pass

func _on_RestartButton_pressed():
	#Get the level scene under tree 
	pass
	get_tree().change_scene("res://Levels/Level1.tscn")

func getScene(level):
	var getRes = "res://Levels/Level"
	var getNum = level
	var getFile =  ".tscn"
	print(getRes,getNum,getFile)

func _on_MainMenuButton_pressed():
	get_tree().change_scene("res://Main_Menu.tscn")
	
