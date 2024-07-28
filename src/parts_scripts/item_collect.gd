extends Area2D

signal enter_collect_true()
signal enter_collect_false()



func _on_body_entered(body):
	print_debug("item")
	if Global.player_item_heart < 3:
		print_debug("low item ", Global.player_item)
		enter_collect_false.emit()
	elif Global.player_item == 3:
		print_debug("high item ", Global.player_item)
		enter_collect_true.emit()
