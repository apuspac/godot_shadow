extends Control

@onready var hp_label= $player_HP
@onready var item_label = $player_get_item


# Called when the node enters the scene tree for the first time.
func _ready():
	update_HP()
	update_item_heart()
	print(Global.player_item_heart)
	print(Global.player_HP)
	

func update_HP():
	hp_label.text = "HP: " + str(Global.player_HP)

func update_item_heart():
	item_label.text = "♡: " + str(Global.player_item_heart)


func _on_heart_get_heart():
	update_item_heart()
