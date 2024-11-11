extends CharacterBody2D
const SPEED = 100
var current_direcction = "none"

func _physics_process(delta):
	player_movement(delta)
	
func _ready():
	$AnimatedSprite2D.play("iddle-down")

func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		play_animation(1)
		current_direcction = "right"
		velocity.x = SPEED
		velocity.y = 0
	elif  Input.is_action_pressed("ui_left"):
		play_animation(1)
		current_direcction = "left"
		velocity.x = -SPEED
		velocity.y = 0
	elif  Input.is_action_pressed("ui_down"):
		play_animation(1)
		current_direcction = "down"
		velocity.y = SPEED
		velocity.x = 0
	elif  Input.is_action_pressed("ui_up"):
		play_animation(1)
		current_direcction = "up"
		velocity.y = -SPEED
		velocity.x = 0
	else:
		play_animation(0)
		velocity.y = 0
		velocity.x = 0
		
	move_and_slide()
	
func play_animation(movement):
	var direction = current_direcction
	var animation = $AnimatedSprite2D
	
	if direction == "right":
		animation.flip_h = false
		if movement == 1:
			animation.play("run-side")
		elif movement == 0:
			animation.play("iddle-side")
	if direction == "left":
		animation.flip_h = true
		if movement == 1:
			animation.play("run-side")
		elif movement == 0:
			animation.play("iddle-side")
	if direction == "down":
		if movement == 1:
			animation.play("run-down")
		elif movement == 0:
			animation.play("iddle-down")
	if direction == "up":
		if movement == 1:
			animation.play("run-up")
		elif movement == 0:
			animation.play("iddle-up")
	
