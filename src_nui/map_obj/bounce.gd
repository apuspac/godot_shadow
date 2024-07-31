extends Node2D

signal notice_bounce_area(inout: bool)

@onready var bounce_collision = $bounce_body/CollisionShape2D
@onready var bounce_area = $bounce_area
@onready var parent = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	pass

func _on_ray_cast_2d_notice_collision_ability_bounce():
	bounce_collision.disabled = true



func _on_bounce_area_body_entered(body):
	parent.enter_bounce_area(true)
	



func _on_bounce_area_body_exited(body):
	parent.enter_bounce_area(false)
