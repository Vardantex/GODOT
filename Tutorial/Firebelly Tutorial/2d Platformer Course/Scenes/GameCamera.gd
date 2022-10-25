extends Camera2D

export(Color, RGB) var backgroundColor


func _ready() -> void:
	VisualServer.set_default_clear_color(backgroundColor)


func _process(delta: float) -> void:
	var players = get_tree().get_nodes_in_group("player")
	
	if (players.size() > 0):
		var player = players[0]
		global_position = player.global_position
