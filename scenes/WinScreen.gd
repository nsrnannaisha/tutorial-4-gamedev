extends Sprite2D

@export var sceneName = "Level2"

func _ready() -> void:
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file(str("res://scenes/" + sceneName + ".tscn"))
