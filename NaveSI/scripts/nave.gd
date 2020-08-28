extends RigidBody2D

const MOVE_SPEED = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = Vector2(0,0)


func _process(delta):	
	if Input.is_action_pressed("ui_right"):
		linear_velocity = Vector2(MOVE_SPEED,0)
		
	if Input.is_action_pressed("ui_left"):
		linear_velocity = Vector2(-1 * MOVE_SPEED,0)
	

	






