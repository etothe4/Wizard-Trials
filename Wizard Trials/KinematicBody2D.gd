extends KinematicBody2D

const FLOOR = Vector2(0, -1)
const GRAVITY = 15
const SPEED = 130
const JUMP_HEIGHT = -410
var motion = Vector2()
var is_dead = false

func _physics_process(delta):
	if is_dead == false:
		motion.y += GRAVITY
	
		if Input.is_action_pressed("ui_right"):
			motion.x = SPEED
			$Sprite.flip_h = false
			$Sprite.play("Walk")
		elif Input.is_action_pressed("ui_left"):
			motion.x = -SPEED
			$Sprite.flip_h = true
			$Sprite.play("Walk")
		else:
			$Sprite.play("Idle")
			motion.x = 0
	
		if is_on_floor():
			if Input.is_action_just_pressed("ui_up"):
				motion.y = JUMP_HEIGHT
		else:
			$Sprite.play("Jump")
	
		motion = move_and_slide(motion, FLOOR)
	
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Enemy" in get_slide_collision(i).collider.name:
					dead()
		
		if position.y > 400:
			get_tree().reload_current_scene()

func dead():
	is_dead = true
	motion = Vector2(0, 0)
	$Sprite.play("Dead")
	$CollisionShape2D.disabled = true
	$Timer.start()

func _on_Timer_timeout():
	get_tree().reload_current_scene()
