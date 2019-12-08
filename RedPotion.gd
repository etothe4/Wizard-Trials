extends Area2D

func _ready():
	$AnimatedSprite.play("red")


func _on_RedPotion_body_entered(body):
	if "Player" in body.name:
		get_tree().change_scene("WinScreen.tscn")
