class_name NotesMain
extends Node2D

@export var main: Main
var notes: Array[Note]

func _ready() -> void:
	for x in get_children():
		if x is Note:
			notes.insert(notes.size(), x)
			x.main = main
			x.notes_main = self
	


func _on_collision_button_up() -> void:
	for x in notes:
		x.deselect()
