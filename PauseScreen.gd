extends Control

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		$CenterContainer/VBoxContainer/Continue.grab_focus()
		get_tree().paused = not get_tree().paused
		visible = not visible

func _on_Continue_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible

func _on_Quit_pressed():
	get_tree().quit()
