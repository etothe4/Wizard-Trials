extends KinematicBody2D

const SPEED = 41
const FLOOR = Vector2(0, -1)
var motion = Vector2()
var direction = 1
var is_dead = false

func _physics_process(delta):
	if is_dead == false:
		if direction == 1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
		
		motion.x = -SPEED * direction
		$AnimatedSprite.play("Move")
		
		motion = move_and_slide(motion, FLOOR)
	
	if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Player" in get_slide_collision(i).collider.name:
					get_slide_collision(i).collider.dead()

func _on_Timer_timeout():
	direction = direction * -1

func dead():
	is_dead = true
	motion = Vector2(0, 0)
	$AudioStreamPlayer.play()
	$AnimatedSprite.play("Dead")
	$CollisionShape2D.set_deferred("disabled", true)
	$InstanceTimer.start()

func _on_InstanceTimer_timeout():
	queue_free()
