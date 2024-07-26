extends Node2D

@onready var pause_panel = $Camera2D/Pause_panel
var paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Escape"):
		pause_menu()
	if Input.is_action_just_pressed("Reset"):
		reset_scene()


func pause_menu():
	if paused:
		pause_panel.hide()
		Engine.time_scale = 1
	else:
		pause_panel.show()
		Engine.time_scale = 0
	
	paused = !paused

func reset_scene():
	get_tree().reload_current_scene() 
