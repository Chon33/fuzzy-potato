extends KinematicBody2D

var velocidad = 100
var animacion = ""
onready var animaciones = $AnimatedSprite
onready var mira = $RayCast2D

# warning-ignore:unused_argument
func _physics_process(_delta):
	var movimiento = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		movimiento.y -= velocidad
		mira.set_cast_to(Vector2(0,-50))
		animacion = "m_arriba"
	elif mira.get_cast_to() == Vector2(0,-50):
		animacion = "q_arriba"
		
	if Input.is_action_pressed("ui_down"):
		movimiento.y += velocidad
		mira.set_cast_to(Vector2(0,50))
		animacion = "m_abajo"
	elif mira.get_cast_to() == Vector2(0,50):
		animacion = "q_abajo"
		
	if Input.is_action_pressed("ui_left"):
		movimiento.x -= velocidad
		mira.set_cast_to(Vector2(-50,0))
		animacion = "m_izq"
	elif mira.get_cast_to() == Vector2(-50,0):
		animacion = "q_izq"
		
	if Input.is_action_pressed("ui_right"):
		movimiento.x += velocidad
		mira.set_cast_to(Vector2(50,0))
		animacion = "m_der"
	elif mira.get_cast_to() == Vector2(50,0):
		animacion = "q_der"
	
	
	move_and_slide(movimiento)
	animaciones.play(animacion)
