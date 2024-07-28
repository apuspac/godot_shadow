extends Node

signal get_heart()

func get_heart_children():
	get_heart.emit()
