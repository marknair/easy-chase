extends CharacterBody2D

# To see the collision shapes, turn them on with
# Debug -> Visible Collision Shapes

@export var speed = 150
var player = null

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		animated_sprite.flip_h = velocity.x < 0
		if not animated_sprite.is_playing():
			animated_sprite.play()
	else:
		velocity = Vector2.ZERO
		animated_sprite.stop()
		animated_sprite.frame = 0
	
	move_and_slide()
	
	

func _on_detection_range_body_entered(body):
	if body.is_in_group("player"):
		player = body

func _on_detection_range_body_exited(body):
	if body.is_in_group("player"):
		player = null
		
#When a body enters the detection range, we call
#the _on_detection_range_body_entered function,
#and it checks if the body is in the "player" group.
#
#If it is, we assign the player variable
#the reference to that body (the player node).
#Similarly, when a body exits the detection range,
#the _on_detection_range_body_exited function is called,
#and it checks if the body is in the "player" group.
#If it is, the player variable is set to null,
#indicating that the player is no longer within the enemy's detection range.
