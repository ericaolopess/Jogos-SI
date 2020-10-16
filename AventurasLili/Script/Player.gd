extends KinematicBody2D

const MOVE_SPEED = 200
const JUMP_FORCE = 1100
const GRAVITY = 50
const MAX_FALL_SPEED = 500

var bullet = preload("res://Scene/bullet.tscn")

var y_velo = 0

var scene_atual
var pontos = 0
var vida = 100

var aLive = true



func _ready():
	scene_atual = get_tree().current_scene
	aLive = true

func count_point():
	if (aLive):
		pontos += 1
		scene_atual.mostra_pontos(pontos)
	

func _physics_process(delta):
	if (aLive):
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
			
		var no_chao = $RayD.is_colliding() or $RayE.is_colliding()
		
		move_and_slide(Vector2(move_dir * MOVE_SPEED, y_velo),Vector2(0,-1))
		
		var grounded = is_on_floor()
		y_velo += GRAVITY
		
		if grounded and Input.is_action_pressed("ui_up"):
			y_velo = -JUMP_FORCE
		
		if grounded and y_velo >= 0:
			y_velo = 5
			
		if y_velo > MAX_FALL_SPEED:
			y_velo = MAX_FALL_SPEED	
			
		if Input.is_action_just_pressed("shot"):
			spaw_bullet()
		
func spaw_bullet():
		var clone_bullet = bullet.instance()
		get_parent().add_child(clone_bullet)
		clone_bullet.position = $Position2D.global_position
		
		if $sprite.flip_h:
			clone_bullet.linear_velocity = Vector2(-800,0)
		else:
			clone_bullet.linear_velocity = Vector2(800,0)


func less_life():
	if (aLive):
		vida = vida - 10
		if vida == 0:
			dead_player()
		print(vida)
		scene_atual.mostra_vida(vida)

	
func dead_player():
	$sprite.play("dead")
	aLive = false
	
	



