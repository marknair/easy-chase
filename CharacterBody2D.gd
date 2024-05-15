extends CharacterBody2D

@export var speed = 200

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = direction * speed
		animated_sprite.flip_h = velocity.x < 0
		if not animated_sprite.is_playing():
			animated_sprite.play()
	else:
		velocity = Vector2.ZERO
		animated_sprite.stop()
		animated_sprite.frame = 0
	
	move_and_slide()
