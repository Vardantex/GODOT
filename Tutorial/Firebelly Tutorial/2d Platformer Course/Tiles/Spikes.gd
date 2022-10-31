extends Node2D


func _ready() -> void:
	pass





func _on_Area2D_area_entered(area: Area2D) -> void:
	print("die")
	get_tree().reload_current_scene()
	
	
	
	
