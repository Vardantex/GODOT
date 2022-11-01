extends CanvasLayer


func _ready():
	#Get the LifeCount Node and set the value 
	$Control/TextureRect/HBoxContainer/LifeCount.text = "3"
	

#Get a parameter for lives and coins
func update_GUI(lives_left, coins):
#Cast the int value from lives in player script as a string
	$Control/TextureRect/HBoxContainer/LifeCount.text = str(lives_left)
	$Control/TextureRect/HBoxContainer/CoinCount.text = str(coins)
	

