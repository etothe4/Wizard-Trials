extends KinematicBody2D

const FLOOR = Vector2(0, -1)
const GRAVITY = 15
const SPEED = 130
const JUMP_HEIGHT = -410
const ATTACK = preload("res://LightningBolt.tscn")
var motion = Vector2()
var starting_position = Vector2(112, 304)
var on_ground = false
var is_dead = false
var jump_count = 0

func _process(delta):
	if is_dead == true:
		move_local_y(-SPEED*delta)

func _physics_process(delta):
	if is_dead == false:
		motion.y += GRAVITY
	
		if Input.is_action_pressed("ui_right"):
			motion.x = SPEED
			$Sprite.flip_h = false
			$Sprite.play("Walk")
			if sign($Position2D.position.x) == -1:
				$Position2D.position.x *= -1
		elif Input.is_action_pressed("ui_left"):
			motion.x = -SPEED
			$Sprite.flip_h = true
			$Sprite.play("Walk")
			if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1
		else:
			$Sprite.play("Idle")
			motion.x = 0
		
		if globals.attack_enabled == true:
			if Input.is_action_just_pressed("ui_select"):
				if($ShotTimer.time_left == 0):
					$ShotSound.play()
					$Sprite.play("Attack")
					var lightningBolt = ATTACK.instance()
					if sign($Position2D.position.x) == 1:
						lightningBolt.set_direction(1)
					else:
						lightningBolt.set_direction(-1)
					get_parent().add_child(lightningBolt)
					lightningBolt.position = $Position2D.global_position
					$ShotTimer.start()
		
		if Input.is_action_just_pressed("ui_up"):
			if jump_count < globals.jump_max:
				$JumpSound.play()
				jump_count += 1
				motion.y = JUMP_HEIGHT
				on_ground = false
		
		if is_on_floor():
			if on_ground == false:
				on_ground = true
				jump_count = 0
		else:
			if on_ground == true:
				on_ground = false
				if globals.jump_max == 1:
					jump_count = 2
				else:
					jump_count = 1
			$Sprite.play("Jump")
		
		motion = move_and_slide(motion, FLOOR)
	
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Enemy" in get_slide_collision(i).collider.name:
					dead()
				if "Walker" in get_slide_collision(i).collider.name:
					dead()
				if "FallingPlatform" in get_slide_collision(i).collider.name:
					get_slide_collision(i).collider.fall()
		
		if position.y > 400:
			dead()

func dead():
	is_dead = true
	motion = Vector2(0, 0)
	$DeathSound.play()
	$Sprite.play("Dead")
	$CollisionShape2D.disabled = true
	get_parent().get_node("CanvasLayer2/DeathScreen").show()
	globals.lives -= 1
	$Timer.start()

func _on_Timer_timeout():
	if globals.lives > 0:
		is_dead = false
		get_parent().get_node("CanvasLayer2/DeathScreen").hide()
		$CollisionShape2D.disabled = false
		position = starting_position
	else:
		get_tree().change_scene("GameOverScreen.tscn")

func upgrade_jump():
	globals.jump_max = 2

func enable_attack():
	globals.attack_enabled = true
