class_name Grid
extends Node2D

@export var main: Main

@export var cell_size: float = 16
@export var zoom_hide: float = 0.25
# Moves accordingly to the camera
func _process(_delta: float) -> void:
	position = snapped(main.camera.position, Vector2(cell_size, cell_size))
	
	if main.camera.zoom.x <= zoom_hide:
		hide()
	else:
		show()
