extends Node2D

signal player_won
onready var animPlayer = get_node("AnimationPlayer")

func _ready() -> void:
	$Area2D.connect("area_entered", self, "on_area_entered")
	$TransitionLayer/ColorRect.visible = false

func _process(delta: float) -> void:
	pass
	
	

func on_area_entered(_area2d):
	$TransitionLayer/ColorRect.visible = true
	animPlayer.play("TRANSITION_PLAYER")
	yield(animPlayer, "animation_finished")
	emit_signal("player_won")
	get_tree().reload_current_scene()
