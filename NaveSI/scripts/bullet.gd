extends RigidBody2D


func _on_Area2D_body_entered(body):
	if body.name == "Inimigos":
		print(body)
		body.Dano()
		queue_free()
	
	
	
	
	
	
	
	
	
