extends Control

@onready var hp_label= $player_HP
@onready var item_label = $player_get_item
@onready var hp_heart = [
	$HP/AnimatedSprite2D, 
	$HP/AnimatedSprite2D2, 
	$HP/AnimatedSprite2D3, 
	$HP/AnimatedSprite2D4, 
	$HP/AnimatedSprite2D5
]

# Called when the node enters the scene tree for the first time.
func _ready():
	update_HP()
	update_item_heart()
	print(Global.player_item_heart)
	print(Global.player_HP)
	

func update_HP():
	var i = 0
	for heart in hp_heart:
		if i < Global.player_HP:
			heart.visible = true
		i += 1

func update_item_heart():
	var item_text = ""
	for i in range(0, Global.player_item_heart):
		item_text += "♡"
	
	item_label.text = item_text


func _on_heart_get_heart():
	update_item_heart()
