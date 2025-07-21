extends Button
class_name Note

var main: Main
var selected: bool = false
var dragging: bool = false
@export var double_click_timer: Timer


func deselect_other():
	for x in main.notes.get_children():
		if x is Note and x != self:
			x.selected = false

func select():
	selected = true
	rotation = 0.2
func deselect():
	selected = false
	rotation = 0


func _on_button_down() -> void:
	
	if Input.is_action_pressed("shift_select"):
		select()
	else:
		deselect()
	
	dragging = true
	
	# Double Click
	if not double_click_timer.is_stopped(): 
		double_click()
		double_click_timer.stop()
	else:
		double_click_timer.start(main.double_click_cooldown)


func _on_button_up() -> void:
	dragging = false
	# Snap position
	position = snapped(position, Vector2(main.grid.cell_size, main.grid.cell_size))

func _input(event: InputEvent) -> void:
	if dragging == false: return
	
	for x in main.notes.get_children():
		if x is Note:
			if event is InputEventMouseMotion and x.selected == true:
				position += event.relative / main.camera.zoom.x

func double_click() -> void:
	print("asdas")
