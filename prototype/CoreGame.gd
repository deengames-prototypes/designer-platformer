extends Node2D

const Exit = preload("res://Entities/Exit.gd")

onready var _victory = $Victory/Control

var _game_over:bool = false

func load_level(number:int) -> void:
	var level_type = load("res://Levels/Level" + str(number) + ".tscn")
	var level = level_type.instance()
	
	for child in level.get_children():
		if child is Exit:
			child.connect("player_exited", self, "_on_player_exited")
		# TODO: find player, note location, and respawn there if dies
			
	add_child(level)

func _on_player_exited(player:KinematicBody2D) -> void:
	# prevent it from happening multiple times
	if player != null and is_instance_valid(player):
		player.queue_free()
	_victory.visible = true
	_game_over = true

func _unhandled_input(_event) -> void:
	if _game_over and Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://LevelSelection.tscn")
