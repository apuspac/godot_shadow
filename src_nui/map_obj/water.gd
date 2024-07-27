extends Node2D

signal notice_water_area(inout: bool)

@onready var water_collision = $water_body/CollisionShape2D
@onready var water_area = $water_area

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	pass

func _on_ray_cast_2d_notice_collision_ability_water():
	water_collision.disabled = true



func _on_water_area_body_entered(body):
	notice_water_area.emit(true)


func _on_water_area_body_exited(body):
	notice_water_area.emit(false)
