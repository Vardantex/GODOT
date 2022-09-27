extends Node2D

var lives = 3

const WORLD_LIMIT = 3000

func _ready():
	add_to_group("GameState")
	
	#Check if player entity is out of bounds
	if position.y > WORLD_LIMIT:
		end_game()
	

func hurt():
	lives -=1 
	$Player.hurt()
	if lives <= 0:
		end_game()

func end_game():
	get_tree().change_scene("res://Levels/GameOver.tscn")
