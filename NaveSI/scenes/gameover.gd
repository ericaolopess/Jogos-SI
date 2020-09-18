extends Node2D




func _ready():
	$CanvasLayer/best_score.text = "Best = " + str(SaveScore.best_score)
	$CanvasLayer/last_score.text = "Last = " + str(SaveScore.last_score)
	

func _on_btn_menu_pressed():
	get_tree().change_scene("res://scenes/menu.tscn")


func _on_btn_game_pressed():
	get_tree().change_scene("res://scenes/fase1.tscn")
