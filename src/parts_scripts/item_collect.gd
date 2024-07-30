extends Area2D

signal enter_collect_true()
signal enter_collect_false()

@onready var clear_sound = $CLEAR_Sound

func _on_body_entered(body):
	print_debug("item")
	if Global.player_item_heart < 3:
		print_debug("low item ", Global.player_item_heart)
		enter_collect_false.emit()
	elif Global.player_item_heart == 3:
		print_debug("high item ", Global.player_item_heart)
		clear_sound.play()
		enter_collect_true.emit()
