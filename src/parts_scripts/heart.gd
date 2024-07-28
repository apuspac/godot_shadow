extends Area2D

signal get_heart()

@onready var parent = get_parent()

func _on_body_entered(body):
	Global.add_player_item_heart()
	parent.get_heart_children()
	print_debug("+1 Heart!")
	print_debug(Global.player_item_heart)
	queue_free()
