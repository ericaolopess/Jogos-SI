extends Node2D


var pontos = 0
var life = 3


func _ready():
	$CanvasLayer/pontos.text = str(pontos)
	life = 3
	$CanvasLayer/life1.visible = true
	$CanvasLayer/life2.visible = true
	$CanvasLayer/life3.visible = true

func addScore():
	pontos += 1
	$CanvasLayer/pontos.text = str(pontos)

func dano():
	life -= 1
	
	if (life == 2):
		$CanvasLayer/life1.visible = false
		$CanvasLayer/life2.visible = true
		$CanvasLayer/life3.visible = true
	elif (life == 1):
		$CanvasLayer/life1.visible = false
		$CanvasLayer/life2.visible = false
		$CanvasLayer/life3.visible = true	
	else:
		gameOver()
		
		
func gameOver():
	
	SaveScore.last_score = pontos
	
	if pontos > SaveScore.best_score:
		SaveScore.best_score = pontos
	
	get_tree().change_scene("res://scenes/gameover.tscn")
	

func _on_colisor_body_entered(body):
	if body.is_in_group("Tiro"):
		print(body.name)	
		body.queue_free()
		
		
		
