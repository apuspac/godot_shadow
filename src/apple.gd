extends Area2D




func _on_body_entered(body):
	print("get apple")
	queue_free()
