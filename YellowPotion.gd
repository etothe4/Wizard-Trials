extends Area2D

var node

func _ready():
	$AnimatedSprite.play("yellow")


func _on_YellowPotion_body_entered(body):
	if "Player" in body.name:
		body.enable_attack()
		$AudioStreamPlayer.play()
		node = body.get_parent().get_node("CanvasLayer3/YellowPotionGetScreen")
		node.show()
		get_tree().paused = not get_tree().paused
		$Timer.start()


func _on_Timer_timeout():
	node.hide()
	get_tree().paused = not get_tree().paused
	queue_free()
