extends Node

signal notice_enter_bounce_area(inout: bool)

func enter_bounce_area(inout: bool):
	notice_enter_bounce_area.emit(inout)


func _on_ray_cast_2d_notice_collision_ability_bounce(collision_id):
	get_tree().call_group("Bounce_obj", "ability_bounce", collision_id)
