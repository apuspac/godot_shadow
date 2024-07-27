extends Node2D


@onready var animation_player = $move_test/AnimationPlayer

var animation_flag: bool = false
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	yoko_animation_play()

func yoko_animation_play():
	if animation_flag:
		animation_player.play("move")
	else:
		animation_player.pause()


func _on_ray_cast_2d_notice_collision_ability_move():
	animation_flag = true
