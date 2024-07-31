extends Node2D

@onready var obj_animation = $Node2D/AnimatableBody2D/AnimatedSprite2D
@onready var move_animation = $Node2D/AnimatableBody2D/AnimationPlayer
@onready var area_2d = $Area2D


var animation_flag: bool = false
var is_collision_once: bool = true

func _ready():
	add_to_group("Move_obj")
	
func gimick_on_play():
	if is_collision_once:
		#print_debug("collision move")
		move_animation.play("move")
		obj_animation.play("on_gimmick")
		is_collision_once = false

func ability_move(id: RID):
	if id == area_2d.get_rid():
		gimick_on_play()

