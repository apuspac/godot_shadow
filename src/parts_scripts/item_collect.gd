extends Area2D

signal enter_collect_true()
signal enter_collect_false()



@onready var clear_sound = $CLEAR_Sound

func _on_body_entered(body):
	var label_text: String = ""
	
	print_debug("item")
	if Global.player_item_heart[Global.progress] < 2:
		print_debug("low item ", Global.player_item_heart)
		label_text = "low item"
	elif Global.player_item_heart[Global.progress] == 2:
		print_debug("high item ", Global.player_item_heart)
		Global.progress += 1
		label_text = "CLEAR " + str(Global.progress)
		clear_sound.play()
	
	enter_collect_true.emit(label_text)
