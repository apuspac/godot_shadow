extends CharacterBody2D

signal delete_wall(pos:Vector2, time:int)
signal change_wall(pos:Vector2, flip_h:bool, time:int)
signal notice_shadow_color(color:int)


const MAP_OBJ = preload("res://src/map.tscn")

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var player_raycast: RayCast2D = $RayCast2D
@onready var player_light_occluder: LightOccluder2D = $LightOccluder2D






# global var
const SPEED: float = 300.0
const JUMP_VELOCITY: float = -700.0
var gravity: float  = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction: Vector2 = Vector2.ZERO
var light_position: Vector2 = Vector2.ZERO
var shadow_color: int = 0
var on_water: bool = false
var on_bounce: bool = false
var float_gravity: float = -700.0
var bounce_force: float = -1400.0

var bounce_timer: float = 0.0
var boucne_dulation: float = 0.1


func _process(delta: float) -> void:
	var current_time = Time.get_ticks_msec() / 1000.0
	change_visible_ray()
	change_ray_color()

	action_a_old(current_time)
	action_s_old(current_time)

func _physics_process(delta: float) -> void:
	move_func(delta)
	update_animation()
	update_animation_direction()
	update_ability_direction()
	move_and_slide()
	update_raycast_position()

func move_func(delta: float ) -> void:
	# Add the gravity.
	if bounce_timer > 0:
		bounce_timer -= delta
	else:
		if on_water:
			velocity.y += float_gravity * delta
		elif on_bounce:
			velocity.y += bounce_force * delta
		elif not is_on_floor():
			velocity.y += gravity * delta


	# Handle jump.
	if Input.is_action_just_pressed("Space") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	direction = Input.get_vector("Left", "Right", "Up", "Down")

	if direction:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


# animation func
func update_animation() -> void:
	if direction.x != 0:
		animated_sprite.play("Run")
	else:
		animated_sprite.play("Idle")

func update_animation_direction():
	if Input.is_action_just_pressed("Left") or Input.is_action_just_pressed("Right"):
		if direction.x > 0:
			animated_sprite.flip_h = true
		elif direction.x < 0:
			animated_sprite.flip_h = false

# update raycast position
func update_raycast_position() -> void:
	var light_angle = position.angle_to_point(light_position) - PI /2
	if(light_angle < -PI):
		light_angle += 2 * PI
	player_raycast.rotation = light_angle




# ability function
var ability_direction_h: bool = false
func update_ability_direction():
	if direction.x > 0:
		ability_direction_h = true
	elif direction.x < 0:
		ability_direction_h = false

func change_visible_ray():
	if Input.is_action_just_pressed("A"):
		player_light_occluder.visible = !player_light_occluder.visible
		player_raycast.enabled = player_light_occluder.visible
		
		


		print("A osaretanoda")


func change_ray_color():
	if Input.is_action_just_pressed("S"):

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
		print("shadow_color", shadow_color)
		print(player_raycast.collision_mask)
	

	if(shadow_color > 4):
		shadow_color = 0





func _on_point_light_2d_right_send_light_position(light_p:Vector2):
	light_position = light_p







var start_time: float = 0.0
var held_time: float  = 0.0
var holding_button: bool = false

var start_time_s: float = 0.0
var held_time_s: float = 0.0
var holding_button_s: bool = false


func action_a_old(current_time: int) -> void:
	if Input.is_action_pressed("A"):
		if not holding_button:
			start_time = current_time
			holding_button = true
		else:
			held_time = current_time - start_time
	elif Input.is_action_just_released("A"):
		if holding_button:
			holding_button = false
			delete_wall.emit(position, int(ceil(held_time) * 3))
			held_time = 0.0

func action_s_old(current_time):
	if Input.is_action_pressed("S"):
		if not holding_button_s:
			start_time_s = current_time
			holding_button_s = true
		else:
			held_time_s = current_time - start_time_s
	elif Input.is_action_just_released("S"):
		if holding_button_s:
			holding_button_s = false
			change_wall.emit(position, ability_direction_h, int(ceil(held_time_s)))
			held_time_s = 0.0

func water_area_process(inout: bool)-> void:
	if(inout == true):
		on_water = true
		print("ukabu :", on_water)
	else:
		on_water = false
		#if(velocity.y > 0):
			#on_water_floating = 2
		#else:
			#on_water_floating = 1
		print("ukabanai :", on_water)

func bounce_area_process(inout: bool)-> void:
	if(inout == true):
		velocity.y = bounce_force
		bounce_timer = boucne_dulation

func _on_water_notice_water_area(inout: bool) -> void:
	water_area_process(inout)	

func _on_water_2_notice_water_area(inout):
	water_area_process(inout) # Replace with function body.


func _on_bounce_notice_bounce_area(inout):
	bounce_area_process(inout)
