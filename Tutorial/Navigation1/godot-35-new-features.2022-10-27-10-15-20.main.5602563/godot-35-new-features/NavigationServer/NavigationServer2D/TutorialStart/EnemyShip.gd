extends KinematicBody2D

#Pick a node for enemy to target follow
export var path_to_player := NodePath()

onready var _agent: NavigationAgent2D = $NavigationAgent2D
onready var timer: Timer = $Timer
onready var _sprite: Sprite = $Sprite


var _velocity := Vector2.ZERO

onready var _player := get_node(path_to_player)

func _ready() -> void:
	_agent.set_target_location(_player.global_position)
	
	

func _physics_process(delta: float) -> void:
#	if _agent.is_navigation_finished():
#
#		return
	
	
	var direction := global_position.direction_to(_agent.get_next_location())
	
	#Formula
	var desired_velocity = direction * 500
	var steering = (desired_velocity - _velocity) * delta * 4
	_velocity += steering
	
	_velocity = move_and_slide(_velocity)
	
	_sprite.rotation = _velocity.angle()
	





func _on_Timer_timeout() -> void:
	_agent.set_target_location(_player.global_position)
	pass # Replace with function body.
