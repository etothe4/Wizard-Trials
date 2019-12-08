extends Area2D

export(String, FILE, "*.tscn") var next_room

func _on_Door_body_entered(body):
	if "Player" in body.name:
		get_tree().change_scene(next_room)
