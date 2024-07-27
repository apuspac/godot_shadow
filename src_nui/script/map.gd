extends TileMap



# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# func erase_cell_(pos: Vector2) -> void :

func _on_player_delete_wall(pos:Vector2, time:int) -> void:
	var map_pos = local_to_map(pos)

	for delete_pos in get_delete_scope(map_pos, time):
		erase_cell(1, delete_pos)

# Increase the area of effect according to the number of seconds.
func get_delete_scope(pos:Vector2, num:int) -> Array:
	var scope = []

	if num % 2 == 0:
		num -= 1

	for x in range(pos.x - (num / 2), pos.x + (num / 2) + 1):
		for y in range(pos.y - (num / 2) + 1, pos.y + (num / 2) + 1):
			scope.append(Vector2(x, y))

	return scope


# flip_h: true -> rifht, false -> left
func _on_player_change_wall(pos:Vector2, flip_h:bool, time:int):
	var layer_num = 1
	var tile_source_id = 0
	var map_pos = local_to_map(pos)

	for change_pos in get_change_scope(map_pos, flip_h, time):
		set_cell(layer_num, change_pos, tile_source_id, Vector2(10,0))


func get_change_scope(pos:Vector2, flip_h:bool, num:int) -> Array:
	var scope = []

	for x in range(1, num + 2):
		if(flip_h):
			scope.append(Vector2(pos.x + x, pos.y))
		else:
			scope.append(Vector2(pos.x - x, pos.y))

	# print(scope)

	return scope
