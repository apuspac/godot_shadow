extends Area2D


signal enter_damage_zone()
@onready var timer = $Timer


func _on_body_entered(body):
	print_debug("damage zone entered")
	#Engine.time_scale = 0.5
	Global.damage_player()
	
	if Global.player_HP < 1:
		body.get_node("CollisionShape2D").queue_free()	
		
	enter_damage_zone.emit()
	timer.start()



func _on_timer_timeout():
	pass
	#Engine.time_scale = 1.0
	#get_tree().reload_current_scene()
