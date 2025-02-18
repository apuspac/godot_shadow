extends Node2D

# player
var player_item_heart: Array[int] = [0, 0, 0]
var player_HP = 5
var progress = 0

func add_player_item_heart() -> void:
	player_item_heart[progress] += 1

func retry() -> void:
	player_HP = 5

func damage_player() -> void:
	player_HP -= 1

func kill_player() -> void:
	player_HP = 0

func reset_player_hp() -> void:
	player_HP = 5

# store player position for scene change
var player_posision_level1 = Vector2(644, 224)
var player_posision_level2 = Vector2(212, 526)
var player_posision_level3 = Vector2(645, 915)

# visible heart
var level1_heart:Array[bool] = [true, true, true]
var level2_heart:Array[bool] = [true, true, true]
var level3_heart:Array[bool] = [true, true ,true]
