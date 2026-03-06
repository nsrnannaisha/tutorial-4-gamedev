extends Area2D

@export var sceneName = "LoseScreen"

func _on_body_entered(body):
	if body.get_name() == "Player":
		get_tree().call_deferred("change_scene_to_file", 
			str("res://scenes/" + sceneName + ".tscn"))
	else:
		get_parent().call_deferred("queue_free")
