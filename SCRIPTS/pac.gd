extends CharacterBody2D

const SPEED = 300
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

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
		
	move_and_slide()
