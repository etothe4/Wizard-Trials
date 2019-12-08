extends Node

func _ready():
	globals.jump_max = 2
	$FadeIn.show()
	$FadeIn.fade_in()
