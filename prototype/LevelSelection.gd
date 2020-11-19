extends Node2D

func _on_Level1_pressed():
	assert(get_tree().change_scene("res://Levels/Level1.tscn") == OK)
