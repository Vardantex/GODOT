extends Node

signal coin_total_changed

var playerOneNode = null
var playerTwoNode = null


var playerScene = preload("res://Scenes/Player.gd")
var spawnPosition = Vector2.ZERO
var currentPlayerNode = null
var totalCoins = 0 
var collectedCoins = 0


func _ready() -> void:
	#Set spawn where player is in the Scene
#	spawnPosition = $Player.global_position
	register_player($Player)
	
	$P1Spawner.spawn_enemy()
	
	#Get root of overall scene tree of coin.tscn group(?)
	#Gets total coins in current scene: How many nodes are in this scene
	coin_total_changed(get_tree().get_nodes_in_group("coin").size())
	
#	totalCoins = get_tree().get_nodes_in_group("coin").size()
	



#This function updates the various coin total
func coin_total_changed(newTotal):
	totalCoins = newTotal
	emit_signal("coin_total_changed", totalCoins, collectedCoins)
	

#Create a function to collect coins
func coin_collected():
	collectedCoins += 1
	print("Total:", totalCoins, " Collected: ", collectedCoins)
	emit_signal("coin_total_changed", totalCoins, collectedCoins)

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
	






