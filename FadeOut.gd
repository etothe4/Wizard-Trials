extends ColorRect

signal fade_out_finished

func fade_out():
	$AnimationPlayer.play("fadeOut")

func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("fade_out_finished")
