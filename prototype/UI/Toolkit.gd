extends CanvasLayer

const Wall = preload("res://Entities/Wall.tscn")

export var walls:int = 10

var _placing_what:Node2D = null

onready var _placement_overlay = $PlacementOverlay

func _ready():
	$Control/Panel/VBoxContainer/WallButton.text = "x" + str(walls) + " walls"

func _on_WallButton_pressed():
	_placing_what = Wall.instance()
	add_child(_placing_what)
	_placement_overlay.visible = 1

func _on_PlacementOverlay_input_event(viewport, event, shape_idx):
	if _placement_overlay.visible and event is InputEventMouseMotion:
		var motion = event as InputEventMouseMotion
		_placing_what.position = motion.position
