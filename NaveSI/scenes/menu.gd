extends Node2D


func _on_btn_start_pressed():
	get_tree().change_scene("res://scenes/fase1.tscn")


func _on_btn_quit_pressed():
	get_tree().quit()
