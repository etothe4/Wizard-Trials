extends Area2D

func _ready():
	$AnimatedSprite.play("shine")

func _on_LifeUp_body_entered(body):
	if "Player" in body.name:
		globals.lives += 1
		$AudioStreamPlayer.play()
		$AnimatedSprite.play("get")
		$Timer.start()

func _on_Timer_timeout():
	queue_free()
