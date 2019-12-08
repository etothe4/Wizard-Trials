extends Control

func _ready():
	$CenterContainer/VBoxContainer/RestartButton.grab_focus()

func _on_RestartButton_pressed():
	globals.lives = 3
	get_tree().change_scene("Stage1StartScreen.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
