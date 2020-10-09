extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 0.5
var isDead = false

func _ready():
	$AnimatedSprite.play("Walk")
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 500
	isDead = false
	
func _process(delta):
	
	if(!isDead):
		if (posicao_inicial <= posicao_final and flip):
			$".".position.x += velocidade
			$AnimatedSprite.flip_h = false
			if ($".".position.x >= posicao_final):
				flip = false
	
		if ($".".position.x >= posicao_inicial and !flip):
			$".".position.x -= velocidade
			$AnimatedSprite.flip_h = true
			if ($".".position.x <= posicao_inicial):
				flip = true


func _on_AtacarD_body_entered(body):
	if(!isDead):
		if (!flip):	
			$".".position.x += velocidade
			$AnimatedSprite.flip_h = false
			flip = true
			
		$AnimatedSprite.play("Attack")


func _on_AtacarE_body_entered(body):
	if(!isDead):
		if (flip):	
			$".".position.x -= velocidade
			$AnimatedSprite.flip_h = true
			flip = false
			
		$AnimatedSprite.play("Attack")


func _on_AtacarE_body_exited(body):
	if(!isDead):
		$AnimatedSprite.play("Walk")


func _on_AtacarD_body_exited(body):
	if(!isDead):
		$AnimatedSprite.play("Walk")


func _on_Morte_body_entered(body):
	if(!isDead):
		$AnimatedSprite.play("Dead")
		isDead = true


func _on_AnimatedSprite_animation_finished():
	if isDead:
		$".".queue_free()
