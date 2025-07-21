class_name NotesMain
extends Node2D

@export var main: Main

func _ready() -> void:
	for x in get_children():
		if x is Note:
			x.main = main
