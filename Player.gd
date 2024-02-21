extends CharacterBody2D

const SPEED = 300.0
@export var side = 'p1'

func _physics_process(delta):
	var direction = 0

	if side == 'p1':
		direction = get_axis(Input.is_key_pressed(KEY_W), Input.is_key_pressed(KEY_S))
	else:
		direction = get_axis(Input.is_key_pressed(KEY_I), Input.is_key_pressed(KEY_K))

	# Multiplicando direction por SPEED para obter a velocidade correta
	velocity.y = direction * SPEED
	
	# Certifique-se de que move_and_slide recebe a velocidade como parâmetro
	move_and_slide()

func get_axis(up, down):
	if up:
		return -1  # Retorna -1 para subir
	elif down:
		return 1   # Retorna 1 para descer
	return 0       # Retorna 0 se nenhuma tecla estiver pressionada


func _on_area_2d_body_entered(body):
	body.direction.x *= -1
	Main.side = side
