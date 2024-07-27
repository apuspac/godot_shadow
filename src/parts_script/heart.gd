extends Area2D

func _on_body_entered(body):
	Global.player_item += 1
	print_debug("+1 Heart!")
	print_debug(Global.player_item)
	queue_free()
