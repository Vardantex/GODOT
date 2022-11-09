extends Node2D

signal player_won

func _ready() -> void:
	$Area2D.connect("area_entered", self, "on_area_entered")
	$TransitionLayer/ColorRect.visible = false

func _process(delta: float) -> void:
	pass
	
	

func on_area_entered(_area2d):
	$TransitionLayer/ColorRect.visible = true
	$AnimationPlayer.play("TRANSITION_PLAYER")
	emit_signal("player_won")
