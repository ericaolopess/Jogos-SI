extends Node2D


func _ready():
	$HUD/pontos.text = str(0)
	$HUD/ProgressBar.value = 100

func mostra_pontos(pontos):
	$HUD/pontos.text = str(pontos)

func mostra_vida(life):
	$HUD/ProgressBar.value = life
	if life == 0:
		$HUD/GAMEOVER.visible = true

