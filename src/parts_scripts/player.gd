extends CharacterBody2D

# player physics
const SPEED: float = 300.0
const JUMP_VELOCITY: float = -500.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# animation
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer = $Timer
var is_flip_body: bool = false

# SFX
@onready var jump_wav = $jump

# raycast
@onready var player_raycast: RayCast2D = $RayCast2D
@onready var player_light_occluder: LightOccluder2D = $LightOccluder2D
var shadow_color: int = 0
var light_position: Vector2 = Vector2.ZERO
signal notice_shadow_color(shadow_color: int)
signal notice_collision_ability_move()
signal notice_collision_ability_water()
signal notice_collision_ability_bounce()

# ability

func _process(delta: float) -> void:
	var current_time = Time.get_ticks_msec() / 1000.0
	change_visible_ray()
	change_ray_color()

func _physics_process(delta: float):
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	move_func(delta)
	flip_body(direction)
	update_animation(direction)
	update_raycast_position()
	move_and_slide()


func move_func(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Space") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_wav.play()
		

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
		
	if is_on_floor():
		if direction.x != 0:
			animated_sprite.play("run")
		else:
			animated_sprite.play("idle")
	else:
		animated_sprite.play("jump")

# substitude kill animation
func flip_body(direction):
	if(is_flip_body):
		animated_sprite.rotation_degrees += 10.0
	else:
		animated_sprite.rotation_degrees = 0.0



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

func change_visible_ray():
	if Input.is_action_just_pressed("A"):
		player_light_occluder.visible = !player_light_occluder.visible
		player_raycast.enabled = player_light_occluder.visible


func change_ray_color():
	if Input.is_action_just_pressed("S"):
		# Change the layer(collision_mask) of the raycast 
		
		# collision_mask:
		# move: 	mask_id.3,	 bit.4
		# water: 	mask_id.4,	 bit.8
		# counce:	mask_id.5,	 bit.16
		
		if shadow_color == 0:
			player_raycast.collision_mask = 0
		elif shadow_color == 1:
			player_raycast.collision_mask = 4
		elif shadow_color == 2:
			player_raycast.collision_mask = 8
		elif shadow_color == 3:
			player_raycast.collision_mask = 16
		
		notice_shadow_color.emit(shadow_color)
		shadow_color += 1
		
		if shadow_color > 3:
			shadow_color = 0
			

		print_debug("shadow_color: ", shadow_color, "mask_bit: ", player_raycast.collision_mask)

# update raycast position
func update_raycast_position() -> void:
	var light_angle = position.angle_to_point(light_position) - PI /2 + PI
	if(light_angle < -PI):
		light_angle += 2 * PI
	player_raycast.rotation = light_angle



func _on_lights_send_light_position(light_p):
	# maybe　light_position could be an array.
	light_position = light_p

func collision_ability_move():
	notice_collision_ability_move.emit()
	
	
#func collision_ability_water()
#func collision_ability_bounce()
