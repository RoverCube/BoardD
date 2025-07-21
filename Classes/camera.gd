class_name Camera
extends Camera2D

@export var main: Main

var scroll_zoom: float = 1.1
var max_zoom_out: float = 0.20
var max_zoom_in: float = 5.00

func _input(event: InputEvent) -> void:
	# Mouse Drag
	if event is InputEventMouseMotion:
		if Input.is_action_pressed("middle mouse"):
			position += -event.relative / zoom
	
	# Zoom out
	if Input.is_action_pressed("scroll down"):
		zoom = clamp(zoom / Vector2(scroll_zoom, scroll_zoom), 
		Vector2(max_zoom_out, max_zoom_out), 
		Vector2(max_zoom_in, max_zoom_in))
	# Zoom in
	if Input.is_action_pressed("scroll up"):
		zoom = clamp(zoom * Vector2(scroll_zoom, scroll_zoom), 
		Vector2(max_zoom_out, max_zoom_out), 
		Vector2(max_zoom_in, max_zoom_in))
	
	#print(round(zoom.x * 1000) / 10, " %")
