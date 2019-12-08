extends Control

func _ready():
	$CenterContainer/VBoxContainer/QuitButton.grab_focus()

func _on_QuitButton_pressed():
	get_tree().quit()
