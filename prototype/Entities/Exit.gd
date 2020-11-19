extends Node2D

signal player_exited

func _on_Exit_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("player_exited", body)
		
