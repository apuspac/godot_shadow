extends Node2D

# player
var player_item_heart = 0
var player_HP = 5

func add_player_item_heart() -> void:
	player_item_heart += 1

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

# visible heart
var level1_heart:Array[bool] = [true, true, true]
