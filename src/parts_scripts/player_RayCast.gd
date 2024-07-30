
extends RayCast2D

signal notice_collision_ability_move(collision_id: RID)
signal notice_collision_ability_water()
signal notice_collision_ability_bounce()


var ability_id: int = 0


@onready var Player_node = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_colliding():
		if(ability_id == 1):
			ability_move()
		elif (ability_id == 2):
			collision_ability_water()
		elif (ability_id == 3):
			collision_ability_bounce()


func ability_move():
	notice_collision_ability_move.emit(get_collider_rid())

func collision_ability_water():
	notice_collision_ability_water.emit()

func collision_ability_bounce():
	notice_collision_ability_bounce.emit()


func _on_player_notice_shadow_color(color:int):
	ability_id = color
