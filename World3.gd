extends Node

func _ready():
	globals.jump_max = 2
	globals.attack_enabled = true
	$FadeIn.show()
	$FadeIn.fade_in()
