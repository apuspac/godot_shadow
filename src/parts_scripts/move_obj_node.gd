extends Node



func _on_ray_cast_2d_notice_collision_ability_move(collision_id):
	get_tree().call_group("Move_obj", "ability_move", collision_id)
