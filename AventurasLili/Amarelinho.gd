extends Area2D



func _on_Amarelinho_body_entered(body):
	if (body.name) == "Player":
		body.less_life()
