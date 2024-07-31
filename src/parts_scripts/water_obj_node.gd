extends Node

signal notice_enter_water_area(inout: bool)

func _on_ray_cast_2d_notice_collision_ability_water(collision_id):
	get_tree().call_group("Water_obj", "ability_water", collision_id)

func enter_water_area(inout: bool):
	notice_enter_water_area.emit(inout)

