extends Node2D

@onready var obj_animation = $AnimatableBody2D/AnimatedSprite2D
@onready var move_animation = $AnimationPlayer


var animation_flag: bool = false
var is_collision_once: bool = true

func _ready():
	obj_animation.play("idle")
	


func gimick_on_play():
	if is_collision_once:
		print_debug("collision move")
		move_animation.play("move")
		obj_animation.play("on_gimmick")
		is_collision_once = false
	
	
func _on_ray_cast_2d_notice_collision_ability_move():
	gimick_on_play()

func _on_area_2d_body_entered(body):
	gimick_on_play()
