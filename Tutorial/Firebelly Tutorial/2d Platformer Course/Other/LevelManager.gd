extends Node

export(Array, PackedScene) var levelScenes

var currentLevelIndex = 0 



func _ready() -> void:
	change_level(currentLevelIndex)

func change_level(levelIndex):
	currentLevelIndex = levelIndex
	get_tree().change_scene(levelScenes[levelIndex].resource_path)



