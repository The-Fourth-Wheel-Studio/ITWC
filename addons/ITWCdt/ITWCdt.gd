@tool
extends EditorPlugin

var cameraZoneColliderGizmos = preload("res://addons/ITWCdt/gizmo/cameraZone/createCameraZoneColliderGizmo.gd").new()
var cameraZoneBehaviorGizmos = preload("res://addons/ITWCdt/gizmo/cameraZone/createCameraZoneBehaviorGizmo.gd").new()


func _enter_tree():
	add_node_3d_gizmo_plugin(cameraZoneColliderGizmos)
	add_node_3d_gizmo_plugin(cameraZoneBehaviorGizmos)

func _exit_tree():
	remove_node_3d_gizmo_plugin(cameraZoneColliderGizmos)
	remove_node_3d_gizmo_plugin(cameraZoneBehaviorGizmos)
