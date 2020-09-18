extends RigidBody2D

var speed = -150
var game

func _ready():
	add_to_group("Inimigos")
	game = get_tree().current_scene

func _process(delta):
	var pos_y = position.y
	pos_y -= speed * delta
	position.y = pos_y
	

func _on_Area2D_body_entered(body):		
	
	if body.is_in_group("Tiro"):	
		$".".queue_free()
		body.queue_free()
		game.addScore()









