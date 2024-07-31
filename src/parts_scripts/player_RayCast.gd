
extends RayCast2D

signal notice_collision_ability_move(collision_id: RID)
signal notice_collision_ability_water(collision_id: RID)
signal notice_collision_ability_bounce(collision_id: RID)

var ability_id: int = 0


@onready var Player_node = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_colliding():
		
		if(ability_id == 1):
			ability_move()
		elif (ability_id == 2):
			ability_water()
		elif (ability_id == 3):
			ability_bounce()


func ability_move():
	notice_collision_ability_move.emit(get_collider_rid())

func ability_water():
	notice_collision_ability_water.emit(get_collider_rid())

func ability_bounce():
	notice_collision_ability_bounce.emit(get_collider_rid())


func _on_player_notice_shadow_color(color:int):
	ability_id = color
