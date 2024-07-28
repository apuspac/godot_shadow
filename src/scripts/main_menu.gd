extends Control

func _on_start_pressed():
	get_tree().change_scene_to_file("res://src/scene/level_select.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://src/scene/options_menu.tscn")
	
func _on_quit_pressed():
	get_tree().quit()
