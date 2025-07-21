extends Node2D
class_name Note

var main: Main
var notes_main: NotesMain

var selected: bool = false
var selection_moviment_threshold: float = 8.0 # squared

var pressed: bool = false
var m_motion: bool = false
@export var double_click_timer: Timer
@export var selected_pannel: Panel

func select():
	deselect_all()

	selected = true
	selected_pannel.show()
 
func deselect():
	selected = false
	selected_pannel.hide()
func deselect_all():
	for x in notes_main.notes:
		x.deselect()

func double_click() -> void:
	print("asdas")


func _on_pressed() -> void:
	pressed = true # starts grabbing
	print("a")

func _on_relessed() -> void:
	pressed = false # stops grabbing
	if m_motion == true: 
		m_motion = false # Stops moving
		position = snapped(position, Vector2(main.grid.cell_size, main.grid.cell_size)) # Snap to grid
	else:
		if selected == true: double_click()
		else: select()
		
	
	
	print("b")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and pressed == true:
		var motion = event as InputEventMouseMotion
		
		# Returns if event is small for human inperfections
		if motion.relative.length_squared() <= selection_moviment_threshold and m_motion == false:
			return
		
		if m_motion == false: m_motion = true # Mouse Motion
		deselect_all()
		
		position += motion.relative / main.camera.zoom.x # Moves based on camera zoom
