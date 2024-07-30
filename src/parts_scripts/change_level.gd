extends Area2D

signal enter_change_area()
@onready var enter_sound = $change_level_sound


func _on_body_entered(body):
	print_debug("change area2d entered")
	enter_sound.play()
	enter_change_area.emit()


