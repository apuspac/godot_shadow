extends Node2D


@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft

signal collide_player()


const SPEED = 60
var direction = 1




# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# ping pong move
	if ray_cast_right.is_colliding():
		direction = -1
		animation.flip_h = false
	if ray_cast_left.is_colliding():
		direction = 1
		animation.flip_h = true
	
	position.x += direction * SPEED * delta


func _on_killzone_enter_kill_zone():
	collide_player.emit()
