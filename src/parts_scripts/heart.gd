extends Area2D

@onready var parent = get_parent()
@onready var root_node = $"../.."

signal notice_get_heart()

# false-> not get yet
var is_get_heart: bool = false


func _on_body_entered(body):
	print(is_get_heart, Global.level1_heart[0])
	if is_get_heart == false :
		Global.add_player_item_heart()
		parent.get_heart_children()
		print_debug("+1 Heart!")
		notice_get_heart.emit()
		queue_free()
 
