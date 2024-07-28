extends Control

signal jump_level_select()
signal jump_main_menu()

@onready var main = $"../../"

func _on_resume_pressed():
	main.pause_menu()


func _on_level_select_pressed():
	jump_level_select.emit()
	

func _on_main_menu_pressed():
	jump_main_menu.emit()

	
func _on_quit_pressed():
	get_tree().quit()
