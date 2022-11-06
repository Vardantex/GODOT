extends AudioStreamPlayer


func _ready():
	play()
	if playing == false:
		play()
