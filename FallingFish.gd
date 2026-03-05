extends RigidBody2D

@export var sceneName: String = "LoseScreen"

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file("res://scenes/" + sceneName + ".tscn")
	else:
		queue_free()
