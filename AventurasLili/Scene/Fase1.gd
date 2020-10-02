extends Node2D


func _ready():
	$HUD/pontos.text = str(0)

func mostra_pontos(pontos):
	$HUD/pontos.text = str(pontos)
