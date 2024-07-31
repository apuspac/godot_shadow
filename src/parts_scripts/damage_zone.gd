extends Area2D


signal enter_damage_zone()
signal enter_kill_zone()
@onready var timer = $Timer


func _on_body_entered(body):
	print_debug("damage zone entered")
	#Engine.time_scale = 0.5
	Global.damage_player()
	
	if Global.player_HP < 1:
		Global.kill_player()
		body.get_node("CollisionShape2D").queue_free()
		enter_kill_zone.emit()
	else:
		enter_damage_zone.emit()
	
	timer.start()


func _on_timer_timeout():
	if Global.player_HP < 1:
		get_tree().reload_current_scene()
		Global.reset_player_hp()
