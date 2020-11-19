extends Node2D

const Exit = preload("res://Entities/Exit.gd")

onready var _victory = $Victory/Control

var _game_over:bool = false

func _ready() -> void:
	for child in get_children():
		if child is Exit:
			child.connect("player_exited", self, "_on_player_exited")
		# TODO: find player, note location, and respawn there if dies
			
func _on_player_exited(player:KinematicBody2D) -> void:
	# prevent it from happening multiple times
	if player != null and is_instance_valid(player):
		player.queue_free()
		
	_victory.visible = true
	_game_over = true

func _unhandled_input(_event) -> void:
	if _game_over and Input.is_action_just_pressed("ui_accept"):
		assert(get_tree().change_scene("res://LevelSelection.tscn") == OK)
