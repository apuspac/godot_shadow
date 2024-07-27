extends Node2D

signal notice_bounce_area(inout: bool)

@onready var bounce_collision = $bounce_body/CollisionShape2D
@onready var bounce_area = $bounce_area

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	pass

func _on_ray_cast_2d_notice_collision_ability_bounce():
	bounce_collision.disabled = true



func _on_bounce_area_body_entered(body):
	notice_bounce_area.emit(true)


func _on_bounce_area_body_exited(body):
	notice_bounce_area.emit(false)
