extends Area2D

func _on_Checkpoint_body_entered(body):
	if body.name == 'Player':
		body.starting_position = position
