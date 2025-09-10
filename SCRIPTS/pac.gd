extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var player_health = 3

const SPEED = 300
const damage_rate = 1
signal health_depleted

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("quit_pause"):
		pass

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("right"):
		animated_sprite_2d.play("right")
	if Input.is_action_just_pressed("left"):
		animated_sprite_2d.play("left")
	if Input.is_action_just_pressed("down"):
		animated_sprite_2d.play("down")
	if Input.is_action_just_pressed("up"):
		animated_sprite_2d.play("up")
	var input = Input.get_vector('left', 'right', 'up', 'down')
	if input.length() > 0:
		velocity = input * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	move_and_slide()

func take_damage():
	player_health -= 1
	if player_health == 0:
		queue_free()
