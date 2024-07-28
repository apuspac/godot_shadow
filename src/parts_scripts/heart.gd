extends Area2D

signal get_heart()


func _on_body_entered(body):
	Global.add_player_item_heart()
	get_heart.emit()
	print_debug("+1 Heart!")
	print_debug(Global.player_item_heart)
	queue_free()

