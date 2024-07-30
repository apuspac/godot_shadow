extends Area2D


signal enter_kill_zone()
@onready var timer = $Timer


func _on_body_entered(body):
	print_debug("kill zone entered")
	#Engine.time_scale = 0.5
	Global.kill_player()
	body.get_node("CollisionShape2D").queue_free()
	enter_kill_zone.emit()
	timer.start()



func _on_timer_timeout():
	#Engine.time_scale = 1.0
	get_tree().reload_current_scene()
	Global.reset_player_hp()
