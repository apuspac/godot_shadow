extends Control

@onready var transition = $Transition

func _ready():
	$Transition.play("fade_in")
	await get_tree().create_timer(3).timeout
	$Transition.play("fade_out")
	await get_tree().create_timer(2).timeout
