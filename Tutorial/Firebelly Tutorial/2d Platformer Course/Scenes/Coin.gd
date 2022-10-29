extends Node2D


func _ready() -> void:
	
	$Area2D/CollisionShape2D.connect("area_entered", self, "on_area_entered")


func on_area_entered(area2d):
	queue_free()  




func _on_Area2D_area_entered(area: Area2D) -> void:
	queue_free()  
	pass # Replace with function body.
