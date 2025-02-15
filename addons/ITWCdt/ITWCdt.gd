@tool
extends EditorPlugin

#gizmo
var cameraZoneColliderGizmos = preload("res://addons/ITWCdt/gizmo/cameraZone/createCameraZoneColliderGizmo.gd").new()
var cameraZoneBehaviorGizmos = preload("res://addons/ITWCdt/gizmo/cameraZone/createCameraZoneBehaviorGizmo.gd").new()
var cameraRotationGizmos = preload("res://addons/ITWCdt/gizmo/cameraZone/createCameraRotationGizmo.gd").new()
var cameraReferenceGizmos = preload("res://addons/ITWCdt/gizmo/cameraZone/createCameraReferenceGizmo.gd").new()
var pnjDialogueManagerGizmo = preload("res://addons/ITWCdt/gizmo/pnj/createPnjDialogueManagerGizmo.gd").new()

#custom file
var resourceLoader

func _enter_tree():
	#gizmo
	add_node_3d_gizmo_plugin(cameraZoneColliderGizmos)
	add_node_3d_gizmo_plugin(cameraZoneBehaviorGizmos)
	add_node_3d_gizmo_plugin(cameraRotationGizmos)
	add_node_3d_gizmo_plugin(cameraReferenceGizmos)
	add_node_3d_gizmo_plugin(pnjDialogueManagerGizmo)
	
	#custom file
	resourceLoader = preload("res://addons/ITWCdt/ressourceFormatLoader/ITWCdata.gd").new()
	ResourceLoader.add_resource_format_loader(resourceLoader)

func _exit_tree():
	#gizmo
	remove_node_3d_gizmo_plugin(cameraZoneColliderGizmos)
	remove_node_3d_gizmo_plugin(cameraZoneBehaviorGizmos)
	remove_node_3d_gizmo_plugin(cameraRotationGizmos)
	remove_node_3d_gizmo_plugin(cameraReferenceGizmos)
	remove_node_3d_gizmo_plugin(pnjDialogueManagerGizmo)
	
	#custom file
	ResourceLoader.remove_resource_format_loader(resourceLoader)
