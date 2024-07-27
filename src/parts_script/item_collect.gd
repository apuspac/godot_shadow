extends Area2D

signal enter_collect_true()
signal enter_collect_false()



func _on_body_entered(body):
	print_debug("item")
	if Global.player_item < 3:
		print_debug("low item")
		enter_collect_true.emit()
	elif Global.player_item:
		print_debug("high item")
		enter_collect_false.emit()
