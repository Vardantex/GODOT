extends Node2D


func _ready() -> void:
	
	$Area2D/CollisionShape2D.connect("area_entered", self, "_on_Area2D_area_entered")





func _on_Area2D_area_entered(area: Area2D) -> void:
	queue_free()  
	var baseLevel = get_tree().get_nodes_in_group("base_level")[0]
	baseLevel.coin_collected()
	
