@tool
extends EditorPlugin

var TrackGizmos = preload("res://addons/ITWCdt/createGizmo.gd").new()


func _enter_tree():
	add_node_3d_gizmo_plugin(TrackGizmos)

func _exit_tree():
	remove_node_3d_gizmo_plugin(TrackGizmos)
