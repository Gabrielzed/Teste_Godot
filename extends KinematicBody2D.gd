extends KinematicBody2D

var speed = 200
var velocity := Vector2()
var jump_force = -300
var gravity = 500
var life = 25
var hit = 5

func _ready():
	 $Camera2D.current = true
func _process(delta):
	
	velocity.y += gravity * delta
	
	
	velocity.x = 0
	
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$AnimatedSprite.animation = "Run"
		$AnimatedSprite.flip_h = false  
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		$AnimatedSprite.animation = "Run"
		$AnimatedSprite.flip_h = true  
	else:
		
		if is_on_floor():
			$AnimatedSprite.animation = "Idle"

	# Pulo
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_force
		$AnimatedSprite.animation = "Jump"

	
	if not $AnimatedSprite.is_playing():
		$AnimatedSprite.play()

	
	velocity = move_and_slide(velocity, Vector2.UP)

