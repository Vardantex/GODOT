extends Node


var playerScene = preload("res://Scenes/Player.gd")
var spawnPosition = Vector2.ZERO
var currentPlayerNode = null



func _ready() -> void:
	#Set spawn where player is in the Scene
	spawnPosition = $Player.global_position
	register_player($Player)


#Listen to the player death 
func register_player(player):
	#Register existing player character
	currentPlayerNode = player 
	


#Create the scene
func create_player():
	#Create an instance of a player character
	var playerInstance = playerScene.instance()
	
	#Add the new player character below the currentPlayerNode to prevent player overlap
	add_child_below_node(playerInstance, currentPlayerNode)
	#Register new instance
	register_player(playerInstance)
	






