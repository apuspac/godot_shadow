extends Area2D

signal enter_change_area()



func _on_body_entered(body):
	print_debug("change area2d entered")
	enter_change_area.emit()

