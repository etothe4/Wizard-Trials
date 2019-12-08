extends Area2D

var node

func _ready():
	$AnimatedSprite.play("blue")

func _on_BluePotion_body_entered(body):
	if "Player" in body.name:
		body.upgrade_jump()
		$AudioStreamPlayer.play()
		node = body.get_parent().get_node("CanvasLayer3/BluePotionGetScreen")
		node.show()
		get_tree().paused = not get_tree().paused
		$Timer.start()

func _on_Timer_timeout():
	node.hide()
	get_tree().paused = not get_tree().paused
	queue_free()
