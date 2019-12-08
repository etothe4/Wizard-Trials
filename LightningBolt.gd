extends Area2D

const SPEED = 250
var velocity = Vector2()
var direction = 1

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	$AnimatedSprite.play("boltFire")

func set_direction(d):
	direction = d
	if d == -1:
		$AnimatedSprite.flip_h = true

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_LightningBolt_body_entered(body):
	if "Enemy" in body.name:
		body.dead()
	if "Walker" in body.name:
		body.dead()
	if "BLocker" in body.name:
		body.dead()
	queue_free()
