extends Node2D

export var level_unlock = 1

var lives = 4

var coins = 0

var coin_goal = 10
var coin_extra_life = 10


const WORLD_LIMIT = 9000

func _ready():
	add_to_group("GameState")
	update_GUI()
	custom_buttons()
	
	#Check if player entity is out of bounds
	if position.y > WORLD_LIMIT:
		end_game()
	

func hurt():
	lives -=1 
	$Player.hurt()
	update_GUI()
	if lives <= 0:
		end_game()


func update_GUI():
	#call the hurt group from the GUI scene with the method
	#and pass the life value
	get_tree().call_group("GUI", "update_GUI", lives, coins)


func coin_up():
	coins+= 1
	#Call to the GUI group, link a method and pass coin value
	update_GUI()
	
	var multi_coins = (coins % coin_goal) == 0
	if multi_coins:
		life_up()
	

func life_up():
	lives += 1
	update_GUI()
	
	
func end_game():
#	get_tree().call_group("GameOver", "getScene", level_unlock)
	get_tree().change_scene("res://Levels/GameOver.tscn")
	

func win_game():
	if coins != 15:
		get_tree().change_scene("res://Coin_Over.tscn")
	else:
		get_tree().change_scene("res://Levels/Victory.tscn")

func custom_buttons():
	if (Input.is_action_just_pressed("escape_key")):
		get_tree().quit()
	elif (Input.is_action_just_pressed("restart_key")):
		get_tree().reload_current_scene()
		



