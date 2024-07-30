extends Node

signal send_light_position(light_position: Vector2)

func send_light_children(light_p: Vector2):
	send_light_position.emit(light_p)
	

func _on_player_notice_shadow_color(shadow_color):
	get_tree().call_group("Lights", "change_shadow_color", shadow_color)
