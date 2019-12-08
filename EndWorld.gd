extends Area2D

export(String, FILE, "*.tscn") var next_screen

func _on_EndWorld_body_entered(body):
	if "Player" in body.name:
		var node = body.get_parent().get_node("FadeOut")
		node.fade_out()
		$Timer.start()


func _on_Timer_timeout():
	get_tree().change_scene(next_screen)
