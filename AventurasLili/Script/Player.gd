extends KinematicBody2D

var MOVE_SPEED = 200

func _physics_process(delta):
	var move_dir = 0
	
	if Input.is_action_pressed("ui_right"):
		$sprite.animation = "walk"
		$sprite.flip_h = false
		move_dir += 1		
	elif Input.is_action_pressed("ui_left"):
		$sprite.animation = "walk"
		$sprite.flip_h = true
		move_dir -= 1
	else:
		$sprite.animation = "idle"
		
	move_and_slide(Vector2(move_dir * MOVE_SPEED, 0),Vector2(0,-1))
		









