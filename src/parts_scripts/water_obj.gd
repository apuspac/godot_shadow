extends Node2D

@onready var obj_animation = $Node2D/AnimatableBody2D/AnimatedSprite2D
@onready var water_animation = $Node2D/AnimatableBody2D/AnimationPlayer
@onready var area_2d = $Area2DforRaycast
@onready var water_collision = $Node2D/AnimatableBody2D/CollisionShape2D
@onready var parent = get_parent()

var animation_flag: bool = false
var is_collision_once: bool = true

func _ready():
	add_to_group("Water_obj")
	
func gimick_on_play():
	if is_collision_once:
		print_debug("collision water")
		#water_animation.play("move")
		obj_animation.play("on_gimmick")
		water_collision.disabled = true
		is_collision_once = false

func ability_water(id: RID):
	if id == area_2d.get_rid():
		gimick_on_play()
		


func _on_area_2_dfor_raycast_body_entered(body):
	parent.enter_water_area(true)

func _on_area_2_dfor_raycast_body_exited(body):
	parent.enter_water_area(false)
