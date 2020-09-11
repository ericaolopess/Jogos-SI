extends Node2D

onready var inimigo = preload("res://scenes/Inimigos.tscn")
var start_position_x = -300
var start_position_y = 300

func _ready():
	randomize()

func create_clone():
	var clone_inimigo = inimigo.instance()
	clone_inimigo.position = Vector2(rand_range(-100,100), start_position_y)
	add_child(clone_inimigo)
	
func _on_Timer_timeout():
	create_clone()
