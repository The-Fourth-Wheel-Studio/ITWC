@tool
extends EditorPlugin

#gizmo
var cameraZoneColliderGizmos = preload("res://addons/ITWCdt/gizmo/cameraZone/createCameraZoneColliderGizmo.gd").new()
var cameraZoneBehaviorGizmos = preload("res://addons/ITWCdt/gizmo/cameraZone/createCameraZoneBehaviorGizmo.gd").new()
var cameraRotationGizmos = preload("res://addons/ITWCdt/gizmo/cameraZone/createCameraRotationGizmo.gd").new()
var cameraReferenceGizmos = preload("res://addons/ITWCdt/gizmo/cameraZone/createCameraReferenceGizmo.gd").new()
var pnjDialogueManagerGizmo = preload("res://addons/ITWCdt/gizmo/pnj/createPnjDialogueManagerGizmo.gd").new()

var dataLoaderManagerControl = preload("res://addons/ITWCdt/editorControl/dataLoaderManager.tscn").instantiate()

func _enter_tree():
	add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_UR, dataLoaderManagerControl)
	addGizmo()
	
func _exit_tree():
	remove_control_from_docks(dataLoaderManagerControl)
	removeGizmo()
	
func addGizmo():
	#gizmo
	add_node_3d_gizmo_plugin(cameraZoneColliderGizmos)
	add_node_3d_gizmo_plugin(cameraZoneBehaviorGizmos)
	add_node_3d_gizmo_plugin(cameraRotationGizmos)
	add_node_3d_gizmo_plugin(cameraReferenceGizmos)
	add_node_3d_gizmo_plugin(pnjDialogueManagerGizmo)
func removeGizmo():
		#gizmo
	remove_node_3d_gizmo_plugin(cameraZoneColliderGizmos)
	remove_node_3d_gizmo_plugin(cameraZoneBehaviorGizmos)
	remove_node_3d_gizmo_plugin(cameraRotationGizmos)
	remove_node_3d_gizmo_plugin(cameraReferenceGizmos)
	remove_node_3d_gizmo_plugin(pnjDialogueManagerGizmo)
