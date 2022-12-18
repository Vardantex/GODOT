extends CanvasLayer


func _ready() -> void:
	
	#Get a reference to the levels
	var baseLevels = get_tree().get_nodes_in_group("base_level")
	
	#Levels will be set in an array
	if (baseLevels.size() > 0):
		#Connect to the signal linked to coin collection
		baseLevels[0].connect("coin_total_changed", self, "on_coin_total_changed")
		
	

func on_coin_total_changed(totalCoins, collectedCoins):
	$MarginContainer/CoinIterate.text = str(collectedCoins, "/", totalCoins)
