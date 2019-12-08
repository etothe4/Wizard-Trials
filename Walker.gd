extends KinematicBody2D

const GRAVITY = 10
const SPEED = 100
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
		motion.y += GRAVITY
		$AnimatedSprite.play("Walk")
		
		motion = move_and_slide(motion, FLOOR)
	
	if is_on_wall():
		direction = direction * -1
	
	if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Player" in get_slide_collision(i).collider.name:
					get_slide_collision(i).collider.dead()

func dead():
	is_dead = true
	motion = Vector2(0, 0)
	$AudioStreamPlayer.play()
	$AnimatedSprite.play("Dead")
	$CollisionShape2D.set_deferred("disabled", true)
	$Timer.start()

func _on_Timer_timeout():
	queue_free()
