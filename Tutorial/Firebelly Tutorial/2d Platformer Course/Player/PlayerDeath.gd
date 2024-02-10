extends KinematicBody2D

var velocity = Vector2.ZERO

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	velocity = move_and_slide(velocity, Vector2.UP)
	
#	if (is_on_floor()):
#		velocity = lerp(0, velocity, pow(2, -10 * delta))
#
#


func _on_Timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.
