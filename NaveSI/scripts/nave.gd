extends RigidBody2D

onready var bullet = preload("res://scenes/bullet.tscn")

const MOVE_SPEED = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = Vector2(0,0)


func _process(delta):	
	if Input.is_action_pressed("ui_right"):
		linear_velocity = Vector2(MOVE_SPEED,0)
	elif Input.is_action_pressed("ui_left"):
		linear_velocity = Vector2(-1 * MOVE_SPEED,0)
	else:
		linear_velocity = Vector2(0,0)	
	
	if Input.is_action_just_pressed("atirar"):	
		spaw_bullet()

func spaw_bullet():
	
	var clone_bullet = bullet.instance()
	clone_bullet.position = $Position2D.position
	add_child(clone_bullet)
	
	clone_bullet.linear_velocity = Vector2(0,-800)
	
	
	

	






