extends RigidBody2D

@export var sceneName = "LoseScreen"

func _on_FallArea_body_entered(body: Node) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file("res://scenes/" + sceneName + ".tscn")
	else:
		get_parent().call_deferred("queue_free")
