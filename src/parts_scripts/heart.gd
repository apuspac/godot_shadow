extends Area2D

@onready var parent = get_parent()
@onready var root_node = $"../.."

signal notice_get_heart()

# false-> not get yet
var is_get_heart: bool = false
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	if is_get_heart == false :
		Global.add_player_item_heart()
		parent.get_heart_children()
		print_debug("+1 Heart!")
		notice_get_heart.emit()
		animation_player.play("pick_up")
 
