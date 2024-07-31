extends Node

signal send_light_position(light_position: Vector2, id: int)

func send_light_children(light_p: Vector2, lid: int):
	send_light_position.emit(light_p, lid)

var id = 0
func add_unique_key() -> int:
	id += 1
	return id


func _on_player_notice_shadow_color(shadow_color):
	get_tree().call_group("Lights", "change_shadow_color", shadow_color)


func _on_player_notice_change_light(lid: int):
	get_tree().call_group("Lights", "change_on_light", lid)
