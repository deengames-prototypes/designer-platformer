extends Node2D

const CoreGame = preload("res://CoreGame.tscn")

func _on_Level1_pressed():
	var game = CoreGame.instance()
	game.load_level(1)
	
	get_tree().root.add_child(game)
