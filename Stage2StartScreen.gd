extends Control

export(String, FILE, "*.tscn") var next_level
onready var label = get_node("CenterContainer/VBoxContainer/LivesCounter")

func _ready():
	label.set_text("              Lives: " + str(globals.lives))
	$Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene(next_level)
