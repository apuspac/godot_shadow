extends CharacterBody2D

# player physics
const SPEED = 300.0
const JUMP_VELOCITY = -700.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# animation
@onready var animated_sprite = $AnimatedSprite2D
@onready var timer = $Timer
var is_flip_body = false

# 


func _process(delta: float) -> void:
	var current_time = Time.get_ticks_msec() / 1000.0
	change_visible_ray()
	change_ray_color()

func _physics_process(delta):
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	move_func(delta)
	flip_body(direction)
	update_animation(direction)
	move_and_slide()


func move_func(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Space") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


func update_animation(direction):
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true
		
	if direction.x != 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")

# substitude kill animation
func flip_body(direction):
	if(is_flip_body):
		animated_sprite.rotation_degrees += 10.0
	else:
		animated_sprite.rotation_degrees = 0.0

func change_visible_ray():
	if Input.is_action_just_pressed("A"):
		player_light_occluder.visible = !player_light_occluder.visible
		player_raycast.enabled = player_light_occluder.visible

func _on_killzone_enter_kill_zone():
	print("enter kill zone")
	is_flip_body = true
	timer.start()

func _on_timer_timeout():
	is_flip_body = false	

func _on_enemy_collide_player():
	print("enemy collide")
	is_flip_body = true
	timer.start()

