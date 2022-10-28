extends Node2D


func _ready() -> void:
	
	$Area2D.connect("area_entered", self, "on_area_entered")

func on_area_entered(area2d):
	pass
#	queue_free()









