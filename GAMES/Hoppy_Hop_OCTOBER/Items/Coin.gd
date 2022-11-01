extends Node2D

var taken = false

func _ready():
	pass


func _on_Area2D_body_entered(body):
	if not taken:
		$AnimationPlayer.play("die")
		$AudioStreamPlayer2D.play()
		#Connect to gamestate group to update GUI
		get_tree().call_group("GameState", "coin_up")
		taken = true

func die():
	queue_free()
