extends Node

#var screen_size = OS.get_screen_size()
#var window_size = OS.get_window_size()

func _ready():
	#OS.set_window_position(screen_size*0.4 - window_size*0.4)
	$FadeIn.show()
	$FadeIn.fade_in()
