extends Position2D

export var enemyScene: PackedScene

var lifeCheck = false

var currentEnemyNode = null
var spawnOnNextTick = false

func _ready() -> void:
	$SpawnTimer.connect("timeout", self, "on_spawn_timer_timeout")
	if(Input.is_action_pressed("Add_Player")):
		call_deferred("spawn_enemy")



func _process(delta: float) -> void:
	
	if(Input.is_action_pressed("Add_Player1")):
		check_enenmy_spawn()
		
	pass

func spawn_enemy(): 
	#Create an instance of desired node
	currentEnemyNode = enemyScene.instance()
	#Connect desired node instance to the parent node 
	get_parent().add_child(currentEnemyNode)
	#Set the spawn location to the enemy spawner object
	currentEnemyNode.global_position = global_position
	

#Create a function to check if current enemy is stil alive 
func check_enenmy_spawn():
	if (!is_instance_valid(currentEnemyNode)): #isinstancevalid checks if object exist in scene
		if(spawnOnNextTick):
			spawn_enemy()
			spawnOnNextTick = false
		else:
			spawnOnNextTick = true


func on_spawn_timer_timeout():
	
#	check_enenmy_spawn()
	
	pass









