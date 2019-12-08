extends Control

func _ready():
	$CenterContainer/VBoxContainer/HBoxContainer/Start.grab_focus()

func _on_Start_pressed():
	$FadeOut.fade_out()

func _on_Quit_pressed():
	get_tree().quit()

func _on_FadeOut_fade_out_finished():
	get_tree().change_scene("Opening.tscn")
