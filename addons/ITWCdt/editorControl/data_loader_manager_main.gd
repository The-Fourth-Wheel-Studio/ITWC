@tool
extends ScrollContainer

@export var cont : VBoxContainer

func _enter_tree() -> void:
	cont.add_child(ITWCdt_VBoxContainer.init("ITWC data","core/ITWC/pack.ITWCdata"))
