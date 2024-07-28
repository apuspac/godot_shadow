extends Node2D

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
