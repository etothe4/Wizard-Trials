extends KinematicBody2D

const GRAVITY = .2
var motion = Vector2()
export var starting_position = Vector2()

func _ready():
	set_physics_process(false)

func _physics_process(delta):
	motion.y += GRAVITY
	position.y += motion.y

func fall():
	set_physics_process(true)
	$Timer.start()

func _on_Timer_timeout():
	set_physics_process(false)
	yield(get_tree(), "physics_frame")
	$CollisionShape2D.disabled = true
	position = starting_position
	yield(get_tree(), "physics_frame")
	$CollisionShape2D.disabled = false
	motion = Vector2()
